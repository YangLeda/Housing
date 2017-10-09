package com.triplesix.housing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin")
    public String showAdminPage(@CookieValue(value = "as", required = false) String as,
                                @CookieValue(value = "id", required = false) Integer landlordid,
                                Model model) {

        if (as != null && as.equals("Admin")) {
            // dao add model attributes

            return "admin";
        }

        return "redirect:/login_admin";
    }
}
