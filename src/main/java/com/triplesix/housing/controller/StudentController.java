package com.triplesix.housing.controller;

import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.dao.ImgDAO;
import com.triplesix.housing.entity.House;
import com.triplesix.housing.entity.Img;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private HouseDAO houseDAO;

    @Autowired
    private ImgDAO imgDAO;

    @RequestMapping("/student")
    public String showLoginPage(@CookieValue(value = "as", required = false) String as) {
        if (as != null && as.equals("Student")) {
            return "student";
        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping("/house_detail")
    public String showHouseDetail(@RequestParam("id") Integer id,
                                  Model model) {

        // dao
        House house = houseDAO.getHouseById(id);
        List<Img> imgs = imgDAO.getImgsByHouseId(id);

        // add house to model
        model.addAttribute("house", house);
        model.addAttribute("imgs", imgs);

        return "house_detail";
    }
}
