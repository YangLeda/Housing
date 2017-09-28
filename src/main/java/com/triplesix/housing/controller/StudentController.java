package com.triplesix.housing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class StudentController {
    @RequestMapping("/student")
    public String showLoginPage(HttpSession session) {
        // get from session
        String as = (String) session.getAttribute("as");

        if (as.equals("Student")) {
            return "student";
        } else {
            return "redirect:/login";
        }
    }
}
