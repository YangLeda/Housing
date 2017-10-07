package com.triplesix.housing.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    MailSender mailSender;

    @Async
    public void sendEmail(String toMail, String text) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("utshousing@163.com");
        mailMessage.setTo(toMail);
        mailMessage.setSubject("UTS Housing");
        mailMessage.setText(text);
        mailSender.send(mailMessage);
    }
}
