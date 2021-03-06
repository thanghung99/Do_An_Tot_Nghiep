package com.dev.Sales.Services;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dev.Sales.Model.Mail;

@Service
public class MailService {
	@Autowired JavaMailSender mailSender;
	
	 public void sendEmail(Mail mail) {
	        MimeMessage mimeMessage = mailSender.createMimeMessage();
	 
	        try {
	 
	            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
	 
	            mimeMessageHelper.setSubject(mail.getMailSubject());
	            mimeMessageHelper.setFrom(new InternetAddress(mail.getMailFrom(), "FASHION TREND"));
	            mimeMessageHelper.setTo(mail.getMailTo());
	            mimeMessageHelper.setText(mail.getMailContent());
	 
	            mailSender.send(mimeMessageHelper.getMimeMessage());
	 
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }
	    }
	 public void sendEmail(Mail mail,String toMail) {
	        MimeMessage mimeMessage = mailSender.createMimeMessage();
	 
	        try {
	 
	            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
	 
	            mimeMessageHelper.setSubject(mail.getMailSubject());
	            mimeMessageHelper.setFrom(new InternetAddress(mail.getMailFrom(), toMail));
	            mimeMessageHelper.setTo(mail.getMailTo());
	            mimeMessageHelper.setText(mail.getMailContent());
	 
	            mailSender.send(mimeMessageHelper.getMimeMessage());
	 
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }
	    }
}
