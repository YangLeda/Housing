package com.triplesix.housing.controller;

import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LandlordController {

    @Autowired
    private HouseDAO houseDAO;


    @RequestMapping("/landlord")
    public String showMain(HttpSession session, Model model) {
        // get from session
        String as = (String) session.getAttribute("as");
        Integer id = (Integer) session.getAttribute("id");

        if (as.equals("Landlord")) {
            List<House> houses = houseDAO.getLandlordHouses(id);
            model.addAttribute("houses", houses);
            return "landlord";
        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping("/upload_house")
    public String uploadHouse() {
        return "upload_house";
    }

    @RequestMapping("/upload_house_process")
    public String uploadHouseProcess(HttpServletRequest request, HttpSession session) {
        String address = request.getParameter("address");
        Integer price = Integer.parseInt(request.getParameter("price"));
        Integer bedrooms = Integer.valueOf(request.getParameter("bedrooms"));
        Integer bathrooms = Integer.valueOf(request.getParameter("bathrooms"));
        Integer carparks = Integer.valueOf(request.getParameter("carparks"));
        String description = request.getParameter("description");

        // get current id from session
        Integer landlordid = (Integer) session.getAttribute("id");

        houseDAO.addHouse(address, description, price, bedrooms, bathrooms, carparks, "", landlordid);

        return "redirect:/landlord";
    }
}
