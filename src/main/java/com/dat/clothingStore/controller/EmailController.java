package com.dat.clothingStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class EmailController {
	@Autowired
    private MailSender emailSender;

    public void sendEmail(String to) {
        SimpleMailMessage message = new SimpleMailMessage(); 
        message.setFrom("dnguyenvan344@gmail.com");
        message.setTo(to); 
        message.setSubject(""); 
        message.setText("Cảm ơn bạn đã liên hệ với chúng tôi");
        emailSender.send(message);
    }
}
