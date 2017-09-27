package com.triplesix.housing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class RegisterController {

    @RequestMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @RequestMapping("/register_process")
    public String showRegisterProcess(HttpServletRequest request, HttpServletResponse response, Model model) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");

        /*session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("fullname", fullname);
        String gender = request.getParameter("gender");
        session.setAttribute("gender", gender);*/

        return "register_process";
    }

}
