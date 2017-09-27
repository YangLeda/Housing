package com.triplesix.housing.controller;

import com.triplesix.housing.dao.RegisterDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RegisterController {

    @Autowired
    private RegisterDAO registerDAO;

    @RequestMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @RequestMapping("/register_process")
    public String showRegisterProcess(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String fullname = request.getParameter("fullname");

        // DAO add landlord data
        registerDAO.register(username, password, gender, fullname);

        return "register_process";
    }

}
