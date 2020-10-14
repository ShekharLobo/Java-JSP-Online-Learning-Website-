package project;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;
public class EmailSend {

    public static void main(String args[]){
        try{
        	//final String ssl_factory="javax.net.ssl.SSlSocketFactory";
        	String host ="smtp.gmail.com" ;
            String user = "fromdumbstopros@gmail.com";
            String pass = "fdtp@1234";
            String to = "shekharlobo1@gmail.com ";
            String from = "fromdumbstopros@gmail.com";
            String subject = "You've been targetted.";
            String messageText = "Congratulations, your gonna be rich. Ha! Ha! Ha!  ";
            boolean sessionDebug = false;

            Properties props = System.getProperties();
            props.put("mail.smtp.user", user);
           // props.put("mail.smtp.host", d_host);
            //props.put("mail.smtp.port", d_port);
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.debug", "true");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");

//            SecurityManager security = System.getSecurityManager();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            
            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }

    }
}
