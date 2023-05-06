package utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author CBwahyi
 */
public class MailUtil {

    // fields to hold the email credentials and properties
    public String username = "";
    public String pass = "";
    private final Properties props;

    // constructor to set up the email credentials and properties
    public MailUtil() {

        username = "utjafyastat@gmail.com";
        pass = "knffawyvsfgxgfph";
        // set up the email properties
        props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    }

    // method to send an email using the given recipient email, subject, and body
    public void sendEmail(String recipientEmail, String subject, String body) {
        // set up the email session with the given credentials and properties
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, pass);
            }
        });

        try {
            // create a new email message with the given recipient, subject, and body
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);
            message.setContent(body, "text/html; charset=utf-8");

            // send the email message
            Transport.send(message);

            // print confirmation message to console
            System.out.println("Email sent successfully to " + recipientEmail);
        } catch (MessagingException e) {
            // throw a runtime exception if there is an error sending the email
            throw new RuntimeException(e);
        }
    }

    // method to send a notification email to a supervisor for a new leave request
    public void sendNotificationToSupervisor(String supervisorEmail, String employeeId, String startDate, String endDate) {
        // construct the email subject and body
        String subject = "New leave request submitted";
        String body = "A new leave request from employee ID " + employeeId + " has been submitted for the period from " + startDate + " to " + endDate + ".";
        // call the sendEmail method with the supervisor email, subject, and body
        sendEmail(supervisorEmail, subject, body);
    }

    // method to send a rejection notification email to a technical monitor for a leave request
    public void sendRejectionNotificationToTechnicalMonitor(String technicalMonitorEmail, int leaveRequestId) {
        // construct the email subject and body
        String subject = "Leave request rejection notification";
        String body = "Dear Technical Monitor, <br><br>" + "The leave request with ID " + leaveRequestId + " has been rejected. Please login to the system for more details.<br><br>" + "Sincerely, <br>HRH Department";
        // call the sendEmail method with the technical monitor email, subject, and body
        sendEmail(technicalMonitorEmail, subject, body);
    }

    // method to send a rejection notification email to an employee for a leave request
    public void sendRejectionNotificationToEmployee(String employeeEmail, int leaveRequestId) {
        // construct email message
        String subject = "Leave Request Rejected";
        String body = "Dear Employee,\n\nYour leave request with ID " + leaveRequestId + " has been rejected.\n\nThank you,\nYour Company";

        // send email using JavaMail API
        sendEmail(employeeEmail, subject, body);
    }

// method to send an approval notification email to a supervisor for a leave request
    public void sendApprovalNotificationToSupervisor(String supervisorEmail, int leaveRequestId) {
        // construct email message
        String subject = "Leave Request Approval";
        String body = "Dear Supervisor,\n\nThe leave request with ID " + leaveRequestId + " has been approved by you.\n\nThank you.";

        // send email using JavaMail API
        sendEmail(supervisorEmail, subject, body);
    }

// method to send an approval notification email to a technical monitor for a leave request
    public void sendApprovalNotificationToTechnicalMonitor(String technicalMonitorEmail, int leaveRequestId) {
        // construct email message
        String subject = "Leave Request Approval";
        String body = "Dear Technical Monitor,\n\nThe leave request with ID " + leaveRequestId + " has been approved by you.\n\nThank you.";

        // send email using JavaMail API
        sendEmail(technicalMonitorEmail, subject, body);
    }

    // method to send an approval notification email to a technical monitor for a leave request
    public void sendApprovalNotificationToEmployee(String employeeEmail, int leaveRequestId) {
        // construct email message
        String subject = "Leave Request Approval";
        String body = "Dear Employee,\n\nThe leave request with ID " + leaveRequestId + " has been approved.\n\n Please proceed with your Leave on the specified dates\n\n Thank you.";

        // send email using JavaMail API
        sendEmail(employeeEmail, subject, body);
    }

}
