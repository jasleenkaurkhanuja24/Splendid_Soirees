package com.ss.helper;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import java.io.IOException;
import java.io.File;
import java.util.Properties;
import java.util.Random;

public class getmail 
{
    public String composeEmailforOTP(String reciever)
    {
        String otp = randomOTP();
        String msg = "Hey there!! Welcome to Splendid Soirees.\n" + "OPT to reset password : " + otp;
        String subject = "Greetings from splendid soirees!!";
        String to = reciever; 
        System.out.println(to);
        String from = "splendidsoirees13@gmail.com";
        sendEmail(msg,subject,from,to);
        return otp;
    }
    private static void sendEmail(String msg, String subject, String from, String to) 
    {
        String host = "smtp.gmail.com";
        Properties props = System.getProperties();
        //setting important properties
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth","true");
        
        //get the session object
        Session session = Session.getInstance(props,new jakarta.mail.Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication("splendidsoirees13@gmail.com","camdixtivpbxosoo");
            }
        });
        session.setDebug(true);
        //creating the message
        MimeMessage message = new MimeMessage(session);
        try
        {
        //from
            message.setFrom(from);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(msg);
            
            Transport.send(message);
            System.out.println("done");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    private void sendEmailWithAttachment(String msg, String subject, String from, String to) 
    {
        String host = "smtp.gmail.com";
        Properties p = System.getProperties();
        p.put("mail.smtp.host", host);
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.ssl.enable", "true");
        p.put("mail.smtp.posrt", "465");
        
        Session s = Session.getInstance(p, new jakarta.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication("splendidsoirees13@gmail.com","camdixtivpbxosoo");
            }
        });
        MimeMessage m = new MimeMessage(s);
        
        MimeMultipart message = new MimeMultipart();
        MimeBodyPart text = new MimeBodyPart();
        MimeBodyPart attachment = new MimeBodyPart();
        
        String path = "C:\\Users\\91700\\Downloads\\Copy of 2022-03-07-194516.jpg";
        try
        {
            m.setFrom(from);
            m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            m.setSubject(subject);
            
            File file = new File(path);
            
            text.setText(msg);
            attachment.attachFile(file);
            
            message.addBodyPart(text);
            message.addBodyPart(attachment);
            
            m.setContent(message);
            
            Transport.send(m);
            System.out.println("done");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
    private String randomOTP()
    {
        String OTP = "";
        Random randomGenerator = new Random();
        for(int i=1;i<=6;i++)
        {
            int r = (randomGenerator.nextInt(9)+0);
            System.out.println(r);
            OTP = OTP + r;
        }
        return OTP;
    }
    
}


