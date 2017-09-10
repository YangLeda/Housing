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

    @RequestMapping("/login_admin")
    public String showAdminLoginPage() {
        return "login_admin";
    }

    @RequestMapping("/login_process")
    public String loginProcess(HttpServletRequest request, Model model) {

        // get parameters from form
        String as = request.getParameter("as");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String[] remember = request.getParameterValues("remember");


        model.addAttribute("username", username);
        model.addAttribute("as", as);
        if (remember == null){
            model.addAttribute("rememberMe", false);
        }else{
            model.addAttribute("rememberMe", true);
        }


        // get result from dao
        boolean loginResult = loginDAO.checkLogin(as, username, password);
        if (loginResult) {
            model.addAttribute("loginResult", "Login successful!");
        } else {
            model.addAttribute("loginResult", "Login failed!");
        }

        return "login_process";
    }
}
