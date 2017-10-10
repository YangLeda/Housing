package com.triplesix.housing.controller;

import com.triplesix.housing.dao.ApplicationDAO;
import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.dao.ImgDAO;
import com.triplesix.housing.dao.LandlordDAO;
import com.triplesix.housing.entity.Application;
import com.triplesix.housing.entity.House;
import com.triplesix.housing.entity.Img;
import com.triplesix.housing.util.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
@EnableAsync
public class StudentController {

    @Autowired
    private HouseDAO houseDAO;

    @Autowired
    private ImgDAO imgDAO;

    @Autowired
    private ApplicationDAO applicationDAO;

    @Autowired
    private LandlordDAO landlordDAO;

    @Autowired
    private EmailService emailService;


    @RequestMapping("/student")
    public String showLoginPage(@CookieValue(value = "as", required = false) String as,
                                @CookieValue(value = "id", required = false) Integer id,
                                Model model) {
        if (as != null && as.equals("Student")) {
            List<Application> applications = applicationDAO.getApplicationsByStudentId(id);
            model.addAttribute("applications", applications);
            return "student";
        }
        return "redirect:/login?ias=Student";
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

        model.addAttribute("message", "Submit success! Landlord will receive notification.");

        // send email
        String landlordEmail = landlordDAO.getLandlordEmailById(landlordid);
        String text = "You have received a new application! Please visit UTS Online Housing website to see more detail.";
        emailService.sendEmail(landlordEmail, text);

        return "information";
    }

    @RequestMapping("/delete_application")
    public String deleteApplication(@RequestParam("applicationId") Integer applicationId) {
        applicationDAO.deleteApplicationById(applicationId);
        return "redirect:/student";
    }

}
