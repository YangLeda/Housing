package com.triplesix.housing.controller;

import com.triplesix.housing.dao.ApplicationDAO;
import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.entity.Application;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private HouseDAO houseDAO;

    @Autowired
    private ApplicationDAO applicationDAO;


    @RequestMapping("/admin")
    public String showAdminPage(@CookieValue(value = "as", required = false) String as,
                                @CookieValue(value = "id", required = false) Integer landlordid,
                                Model model) {

        if (as != null && as.equals("Admin")) {
            // dao add model attributes
            List<House> houses = houseDAO.getHouses();
            model.addAttribute("houses", houses);

            List<Application> applications = applicationDAO.getAllApplications();
            model.addAttribute("applications", applications);

            return "admin";
        }

        return "redirect:/login_admin";
    }
}
