package com.triplesix.housing.controller;


import com.triplesix.housing.dao.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private LoginDAO loginDAO;

    @RequestMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping("/login_admin")
    public String showAdminLoginPage() {
        return "login_admin";
    }

    @RequestMapping("/login_process")
    public String loginProcess(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {

        // get parameters from form
        String as = request.getParameter("as");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String[] remember = request.getParameterValues("remember");

        /*model.addAttribute("username", username);
        model.addAttribute("as", as);
        if (remember == null) {
            model.addAttribute("rememberMe", false);
        } else {
            model.addAttribute("rememberMe", true);
        }*/

        // get result from dao
        boolean loginResult = loginDAO.checkLogin(as, username, password);

        if (loginResult && as.equals("Student")) {
            session.setAttribute("id", 0);
            return "redirect:/";
        } else if (loginResult && as.equals("Landlord")) {
            session.setAttribute("id", 0);
            return "redirect:/landlord";
        } else {
            model.addAttribute("loginResult", false);
            return "login_process";
        }

    }
}
