package com.triplesix.housing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class StudentController {
    @RequestMapping("/student")
    public String showLoginPage(HttpSession session) {
        // get current id from session
        Integer studentid = (Integer) session.getAttribute("id");

        if (studentid == null || studentid < 1) {
            return "redirect:/login";
        } else {
            return "student";
        }
    }
}
