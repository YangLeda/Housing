package com.triplesix.housing.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.MimeMessageHelper;
import javax.mail.internet.MimeMessage;
import javax.mail.MessagingException;


@Service
public class EmailService {


    @Autowired
    private JavaMailSender mailSender;


    private String setText (String leave){
        String text = leave +
                "<p><a href=\"http://144.217.87.14/\"> http://144.217.87.14 </a></p>"+
                "<p>    </p>"+
                "<p>    </p>"+
                "<p>    </p>"+
                "<p>UTSHousing</p>" +
                "<p>Telephone: +61 401 312 000</p>" +
                "<p>E-mail: utshousing@163.com</p>";
        return text;

    }
    @Async
    public void sendEmail(String toMail, String text) throws MessagingException{
        String message = setText(text);
        MimeMessage mailMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mailMessage,true,"utf-8");

        helper.setFrom("utshousing@163.com");
        helper.setTo(toMail);
        helper.setSubject("UTS Housing");
        helper.setText(message,true);

        mailSender.send(mailMessage);
        //System.out.println("Email not sent: " + mailMessage.getText());

    }
}
