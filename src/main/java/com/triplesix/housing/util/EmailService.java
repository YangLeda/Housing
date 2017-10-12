package com.triplesix.housing.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Async
    public void sendEmail(String toMail, String text, String message) throws MessagingException {

        MimeMessage mailMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true, "utf-8");

        String content = "<h3>" + text + "</h3>";
        if (message != null) {
            content += "<h4>Message from the landlord:</h4>" +
                    message + "<br><br><br>";
        }
        content += "<a href=\"http://144.217.87.14/\">UTS Online Housing</a><br>" +
                "Telephone: +61 401 312 000<br>" +
                "E-mail: utshousing@163.com";

        helper.setFrom("utshousing@163.com");
        helper.setTo(toMail);
        helper.setSubject("UTS Housing");
        helper.setText(content, true);

        //mailSender.send(mailMessage);
        System.out.println("Email:" + mailMessage);
    }

}

