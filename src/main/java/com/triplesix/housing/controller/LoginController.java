package com.triplesix.housing.controller;


import com.triplesix.housing.dao.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    private LoginDAO loginDAO;

    @RequestMapping("/")
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping("/login_process")
    public String loginProcess(HttpServletRequest request, Model model) {

        // get parameters from form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        model.addAttribute("username", username);
        model.addAttribute("password", password);

        // get result from dao
        boolean loginResult = loginDAO.checkLogin(username, password);

        // add result string to model
        if (loginResult) {
            model.addAttribute("loginResult", "Login successful!");
        } else {
            model.addAttribute("loginResult", "Login failed!");
        }

        return "login_process";
    }
}
