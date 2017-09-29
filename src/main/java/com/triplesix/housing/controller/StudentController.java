package com.triplesix.housing.controller;

import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class StudentController {

    @Autowired
    private HouseDAO houseDAO;

    @RequestMapping("/student")
    public String showLoginPage(@CookieValue(value = "as", required = false) String as) {
        if (as != null && as.equals("Student")) {
            return "student";
        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping("/house_detail")
    public String showHouseDetail(HttpServletRequest request, Model model) {

        // parse house id
        Integer id = Integer.parseInt(request.getParameter("id"));
        // dao
        House house = houseDAO.getHouseById(id);

        // add house to model
        model.addAttribute("house", house);

        return "house_detail";
    }
}
