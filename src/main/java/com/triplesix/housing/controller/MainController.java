package com.triplesix.housing.controller;

import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private HouseDAO houseDAO;

    @RequestMapping("/")
    public String showMain(Model model) {
        List<House> houses = houseDAO.getHouses();
        model.addAttribute("houses", houses);
        return "main";
    }

    @RequestMapping("/search")
    public String showSearchMain(HttpServletRequest request, Model model) {
        Integer minBedrooms = Integer.parseInt(request.getParameter("min_bedrooms"));
        Integer minBathrooms = Integer.parseInt(request.getParameter("min_bathrooms"));
        Integer minCarparks = Integer.parseInt(request.getParameter("min_carparks"));
        Integer minPrice = Integer.parseInt(request.getParameter("min_price"));
        Integer maxPrice = Integer.parseInt(request.getParameter("max_price"));

        List<House> houses = houseDAO.searchHouses(minBedrooms, minBathrooms, minCarparks, minPrice, maxPrice);
        model.addAttribute("houses", houses);

        return "main";
    }
}
