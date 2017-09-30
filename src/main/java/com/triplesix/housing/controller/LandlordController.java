package com.triplesix.housing.controller;

import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class LandlordController {

    @Autowired
    private HouseDAO houseDAO;


    @RequestMapping("/landlord")
    public String showMain(@CookieValue(value = "as", required = false) String as,
                           @CookieValue(value = "id", required = false) Integer id,
                           Model model) {

        if (as != null && as.equals("Landlord")) {
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
    public String uploadHouseProcess(@RequestParam("address") String address,
                                     @RequestParam("price") Integer price,
                                     @RequestParam("bedrooms") Integer bedrooms,
                                     @RequestParam("bathrooms") Integer bathrooms,
                                     @RequestParam("carparks") Integer carparks,
                                     @RequestParam("description") String description,
                                     @RequestParam("file") MultipartFile file,
                                     @CookieValue(value = "id", defaultValue = "0") Integer landlordid) {

        String pic = "";
        //file

        houseDAO.addHouse(address, description, price, bedrooms, bathrooms, carparks, pic, landlordid);

        return "redirect:/landlord";
    }

}
