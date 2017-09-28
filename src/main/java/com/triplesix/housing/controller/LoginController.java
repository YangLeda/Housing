package com.triplesix.housing.controller;


import com.triplesix.housing.dao.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("as");
        session.removeAttribute("id");
        return "redirect:/";
    }

    @RequestMapping("/login_process")
    public String loginProcess(HttpServletRequest request, HttpSession session, Model model) {

        // get parameters from form
        String as = request.getParameter("as");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String[] remember = request.getParameterValues("remember");

        // get result from dao
        Integer loginResult = loginDAO.checkLogin(as, username, password);

        if (loginResult > 0 && as.equals("Student")) {
            session.setAttribute("id", loginResult);
            session.setAttribute("as", as);
            return "redirect:/";
        } else if (loginResult > 0 && as.equals("Landlord")) {
            session.setAttribute("id", loginResult);
            session.setAttribute("as", as);
            return "redirect:/landlord";
        } else {
            model.addAttribute("loginResult", false);
            return "login_process";
        }

    }
}
