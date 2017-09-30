package com.triplesix.housing.controller;

import com.triplesix.housing.dao.RegisterDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {

    @Autowired
    private RegisterDAO registerDAO;

    @RequestMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @RequestMapping("/register_process")
    public String showRegisterProcess(@RequestParam("username") String username,
                                      @RequestParam("password") String password,
                                      @RequestParam("fullname") String fullname) {

        // DAO add landlord data
        registerDAO.register(username, password, fullname);

        return "register_process";
    }

}
