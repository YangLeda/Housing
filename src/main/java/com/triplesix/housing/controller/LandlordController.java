package com.triplesix.housing.controller;

import com.triplesix.housing.dao.ApplicationDAO;
import com.triplesix.housing.dao.ApplicationShowDAO;
import com.triplesix.housing.dao.HouseDAO;
import com.triplesix.housing.dao.ImgDAO;
import com.triplesix.housing.entity.Application;
import com.triplesix.housing.entity.ApplicationShow;
import com.triplesix.housing.entity.House;
import com.triplesix.housing.util.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

@Controller
public class LandlordController {

    @Autowired
    private HouseDAO houseDAO;

    @Autowired
    private ImgDAO imgDAO;

    @Autowired
    private ApplicationDAO applicationDAO;

    @Autowired
    private ApplicationShowDAO applicationShowDAO;

    @Autowired
    private EmailService emailService;


    @RequestMapping("/landlord")
    public String showMain(@CookieValue(value = "as", required = false) String as,
                           @CookieValue(value = "id", required = false) Integer landlordid,
                           Model model) {

        if (as != null && as.equals("Landlord")) {
            List<House> houses = houseDAO.getLandlordHouses(landlordid);
            model.addAttribute("houses", houses);

            List<Application> applications = applicationDAO.getApplicationsByLandlordId(landlordid);

            List<ApplicationShow> applicationShows = applicationShowDAO.getApplicationShowsList(applications);

            model.addAttribute("applicationShows", applicationShows);

            return "landlord";
        }

        model.addAttribute("intend_as", "Landlord");
        return "redirect:/login?ias=Landlord";
    }

    @RequestMapping("/upload_house")
    public String uploadHouse() {
        return "upload_house";
    }

    @RequestMapping("/delete_house")
    public String deleteHouse(@RequestParam("houseId") Integer houseId) {
        houseDAO.deleteHouseById(houseId);
        return "redirect:/landlord";
    }

    @RequestMapping("/upload_house_process")
    public String uploadHouseProcess(@RequestParam("address") String address,
                                     @RequestParam("price") Integer price,
                                     @RequestParam("bedrooms") Integer bedrooms,
                                     @RequestParam("bathrooms") Integer bathrooms,
                                     @RequestParam("carparks") Integer carparks,
                                     @RequestParam("description") String description,
                                     @RequestParam("file") MultipartFile[] files,
                                     @CookieValue(value = "id", defaultValue = "0") Integer landlordid,
                                     HttpServletRequest request) throws IOException {

        Integer houseid = -1;

        for (int i = 0; i < files.length; i++) {
            // generate unique file name
            String generatedFileName = Calendar.getInstance().getTimeInMillis() +
                    files[i].getOriginalFilename().replaceAll(" ", "");
            // upload path
            String uploadPath = "/resources/img/" + generatedFileName;
            // fist pic, dao to house database
            if (i == 0) {
                houseid = houseDAO.addHouse(address, description, price, bedrooms, bathrooms, carparks, uploadPath, landlordid);
            }
            // upload real path
            String uploadRealPath = request.getServletContext().getRealPath(uploadPath);
            // write file
            files[i].transferTo(new File(uploadRealPath));
            // dao to img database
            imgDAO.addImg(uploadPath, houseid);
            // log
            System.out.println("File saved: " + uploadRealPath);
        }

        return "redirect:/landlord";
    }

    @RequestMapping("/decide")
    public String decide(@RequestParam("applicationid") Integer applicationId,
                         @RequestParam("decision") String decision,
                         @RequestParam("message") String message) throws MessagingException {

        applicationDAO.setStatusById(applicationId, decision);

        // send email
        String email = applicationDAO.getEmailById(applicationId);
        String text = "One of your application has been " + decision.toLowerCase()+ "!<br>Please visit UTS Online Housing website to see more detail.";

        // message from landlord
        System.out.println("Landlord message: " + message);
        emailService.sendEmail(email, text, message);

        return "redirect:/landlord";
    }

    @ControllerAdvice
    public class GlobalExceptionHandler {
        //CommonsMultipartResolver
        @ExceptionHandler(MaxUploadSizeExceededException.class)
        public String handleError(MaxUploadSizeExceededException e, RedirectAttributes redirectAttributes) {
            redirectAttributes.addFlashAttribute("message", e.getCause().getMessage());
            return "upload_error";
        }
    }

}
