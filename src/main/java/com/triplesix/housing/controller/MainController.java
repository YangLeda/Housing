package com.triplesix.housing.controller;

import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String showSearchMain(Model model) {
        List<House> houses = houseDAO.searchHouses();
        model.addAttribute("houses", houses);
        return "main";
    }
}
