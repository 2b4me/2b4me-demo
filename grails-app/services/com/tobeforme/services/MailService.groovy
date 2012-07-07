package com.tobeforme.services

import javax.mail.internet.*
import javax.mail.*

class MailService {
    
    def host = 'mail.2b4me.com'
    def user = 'info@2b4me.com'
    def port = '25'
    def method = 'smtp'
    def userName = '2b4me.com'
    def passwd = 'Giorgio!@!Daniel'

    def sendMail(to, subject, body) {
        def props = new Properties()
        props.put('mail.smtp.host', host)
        props.put('mail.smtp.user', user)
        props.put('mail.smtp.port', port)
        props.put('mail.smtp.auth', 'true')
        
        def session = Session.getInstance(props, null)
        def msg = new MimeMessage(session)
        msg.setContent(body, 'text/html')
        msg.setSubject(subject)
        msg.setFrom(new InternetAddress(user, userName))
        msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to))
        msg.addRecipient(MimeMessage.RecipientType.BCC, new InternetAddress('info@2b4me.com'))
        
        def transport = session.getTransport(method)
        transport.connect(host, port.toInteger(), user, passwd)
        transport.sendMessage(msg, msg.getAllRecipients())
        transport.close()
    }
}
