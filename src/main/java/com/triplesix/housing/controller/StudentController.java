package com.triplesix.housing.controller;

import com.triplesix.housing.dao.ApplicationDAO;
import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.dao.ImgDAO;
import com.triplesix.housing.entity.Application;
import com.triplesix.housing.entity.House;
import com.triplesix.housing.entity.Img;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private HouseDAO houseDAO;

    @Autowired
    private ImgDAO imgDAO;

    @Autowired
    private ApplicationDAO applicationDAO;


    @RequestMapping("/student")
    public String showLoginPage(@CookieValue(value = "as", required = false) String as,
                                @CookieValue(value = "id", required = false) Integer id,
                                Model model) {
        if (as != null && as.equals("Student")) {
            List<Application> applications = applicationDAO.getApplicationsByStudentId(id);
            model.addAttribute("applications", applications);
            return "student";
        }

        return "redirect:/login";
    }

    @RequestMapping("/house_detail")
    public String showHouseDetail(@RequestParam("id") Integer id,
                                  Model model) {

        // dao
        House house = houseDAO.getHouseById(id);
        List<Img> imgs = imgDAO.getImgsByHouseId(id);

        // add house to model
        model.addAttribute("house", house);
        model.addAttribute("imgs", imgs);

        return "house_detail";
    }

    @RequestMapping("/submit_application")
    public String submitApplication(@RequestParam("phone") String phone,
                                    @RequestParam("email") String email,
                                    @RequestParam("message") String message,
                                    @RequestParam("houseid") Integer houseid,
                                    @RequestParam("landlordid") Integer landlordid,
                                    @CookieValue(value = "as", required = false) String as,
                                    @CookieValue(value = "id", required = false) Integer studentid,
                                    Model model) {

        // ask to log in if not a student
        if (as == null || !as.equals("Student")) {
            return "redirect:/login";
        }

        // generate timestamp
        Date time = new Date();

        // dao
        applicationDAO.addApplication(phone, email, message, time, houseid, studentid, landlordid);

        model.addAttribute("message", "Submit success!");

        String text = new String();
        text = "One Student have live the magress to you";
        applicationDAO.Send_mail("utshousing@163.com","zrb123123@163.com","UTS Housing",text);
        return "information";
    }

}
