package com.triplesix.housing.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;


public class EmailHandler {

    @Autowired
    MailSender mailSender;

    public void sendEmail(String toMail, String text) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("utshousing@163.com");
        mailMessage.setTo(toMail);
        mailMessage.setSubject("UTS Housing");
        mailMessage.setText(text);
        mailSender.send(mailMessage);
    }
}
