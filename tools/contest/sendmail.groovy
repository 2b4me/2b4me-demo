/*
 * Before running this file, make sure that you have set the following files properly in the ./input
 * directory:
 * 
 * contestants.txt
 * This is a list of the contestants that have signed up. This should be a straight copy/paste from the
 * 2b4me Launch Promotion Google Docs of the contestants that need to be contacted.
 * 
 * This script takes one runtime parameter to indicate the communication to send. Here are the values
 * this script supports:
 * 
 * welcome - Sends a welcome e-mail to the listed contestants
 * winners - New winners have been published on the web site
 * 
 * The email template used is determined by the parameter and can be found in the ./templates
 * directory.
 */

import javax.mail.internet.*
import javax.mail.*

if (args.length == 0) {
    println "Need to pass 'welcome' or 'winners' to know which template to render."
    System.exit(0)
}

def currentDate = new java.util.Date()
def log = []

log << "Email sent to the following users on ${currentDate}"
log << ''

def host = 'smtp.gmail.com'
def user = 'info@2b4me.com'
def port = '587'
def method = 'smtp'
def userName = '2b4me.com'
def passwd = 'Testing@123'
def template = "templates/${args[0]}.html"
def subject
switch (args[0]) {
    case 'welcome':
        subject = 'Welcome to the 2b4me Contest'
        break
    case 'winners':
        subject = '2b4me Contest Winners Published'
        break
    default:
        throw new IllegalStateException()
}

def props = new Properties()
props.put('mail.smtp.host', host)
props.put('mail.smtp.port', port)
props.put('mail.smtp.auth', 'true')
props.put('mail.smtp.starttls.enable', 'true')

new File('input/contestants.txt').withReader { reader ->
    
    def x
    while ((x = reader.readLine()) != null) {
        def tokens = x.tokenize('\t')
        def to = tokens[0]
        def cnum = tokens[1]
        def date = tokens[2]
        def time = tokens[3]
        def buffer = new StringBuffer()
        
        new File(template).withReader { reader2 ->
            def y
            while ((y = reader2.readLine()) != null) {
                y = y.replace('#date', "${date} at ${time}")
                y = y.replace('#cnum', cnum)
                buffer.append(y)
                buffer.append('\n')
            }
        }
        
        def session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, passwd);
            }
        })
        def msg = new MimeMessage(session)
        msg.setContent(buffer.toString(), 'text/html')
        msg.setSubject(subject)
        msg.setFrom(new InternetAddress(user, userName))
        msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to))
        
        try {
            println 'Sending message'
            Transport.send(msg)
            println 'Done'
        } catch (Exception e) {
            println "Exception trying to send mail: ${e}"
        } finally {
            println ''
        }
        
        log << to
        
        this.sleep(1500)
    }
    
}

println 'Writing log'

log << ''
log << '--'
log << 'This was the email sent:'
log << ''

new File(template).withReader { reader2 ->
    def y
    while ((y = reader2.readLine()) != null) {
        log << y
    }
}

new File("output/email-campaign-${currentDate.getTime()}.txt").withWriter { out ->
    log.each {
        out.writeLine(it)
    }
}