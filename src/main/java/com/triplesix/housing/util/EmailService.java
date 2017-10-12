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
    public void sendEmail(String toMail, String text) throws MessagingException {
        String message = text +
                "<p><a href=\"http://144.217.87.14/\"> http://144.217.87.14 </a></p>" +
                "<p>    </p>" +
                "<p>    </p>" +
                "<p>    </p>" +
                "<p>UTSHousing</p>" +
                "<p>Telephone: +61 401 312 000</p>" +
                "<p>E-mail: utshousing@163.com</p>";
        MimeMessage mailMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true, "utf-8");

        helper.setFrom("utshousing@163.com");
        helper.setTo(toMail);
        helper.setSubject("UTS Housing");
        helper.setText(message, true);

        mailSender.send(mailMessage);
        //System.out.println("Email not sent: " + mailMessage.getText());
    }

}
