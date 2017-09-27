package com.triplesix.housing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LandlordController {

    @RequestMapping("/landlord")
    public String showLandlord() {

        return "landlord";
    }
}
