package com.tobeforme.services

import javax.mail.internet.*
import javax.mail.*

class MailService {
    
    def host = 'smtp.gmail.com'
    def user = 'info@2b4me.com'
    def port = '587'
    def method = 'smtp'
    def userName = '2b4me.com'
    def passwd = 'Testing@123'

    def sendMail(to, subject, body) {
        def props = new Properties()
        props.put('mail.smtp.host', host)
        props.put('mail.smtp.port', port)
        props.put('mail.smtp.auth', 'true')
        props.put('mail.smtp.starttls.enable', 'true')
        
        def session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, passwd);
            }
        })
        def msg = new MimeMessage(session)
        msg.setContent(body, 'text/html')
        msg.setSubject(subject)
        msg.setFrom(new InternetAddress(user, userName))
        msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to))
        msg.addRecipient(MimeMessage.RecipientType.BCC, new InternetAddress('info@2b4me.com'))
        
        def success = false
        try {
            log.debug 'Sending Message'
            Transport.send(msg)
            log.debug 'Done'
            success = true
        } catch (Exception e) {
            log.error "Exception trying to send mail: ${e}"
        }
        
        return success
    }
}
