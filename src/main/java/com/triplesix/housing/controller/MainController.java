package com.triplesix.housing.controller;

import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private HouseDAO houseDAO;

    @RequestMapping("/")
    public String showMain(Model model) {
        List<House> houses = houseDAO.getHouses();
        model.addAttribute("houses", houses);
        model.addAttribute("num", houses.size());

        model.addAttribute("min_bedrooms", 0);
        model.addAttribute("min_bathrooms", 0);
        model.addAttribute("min_carparks", 0);
        model.addAttribute("min_price", 0);
        model.addAttribute("max_price", 9999);

        return "new";
    }

    @RequestMapping("/search")
    public String showSearchMain(@RequestParam("min_bedrooms") Integer minBedrooms,
                                 @RequestParam("min_bathrooms") Integer minBathrooms,
                                 @RequestParam("min_carparks") Integer minCarparks,
                                 @RequestParam("min_price") Integer minPrice,
                                 @RequestParam("max_price") Integer maxPrice,
                                 Model model) {

        List<House> houses = houseDAO.searchHouses(minBedrooms, minBathrooms, minCarparks, minPrice, maxPrice);
        model.addAttribute("houses", houses);
        model.addAttribute("num", houses.size());

        model.addAttribute("min_bedrooms", minBedrooms);
        model.addAttribute("min_bathrooms", minBathrooms);
        model.addAttribute("min_carparks", minCarparks);
        model.addAttribute("min_price", minPrice);
        model.addAttribute("max_price", maxPrice);
        return "main";
    }
}
