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

def host = 'mail.2b4me.com'
def method = 'smtp'
def port = '25'
def user = 'info@2b4me.com'
def userName = '2b4me Launch Promotion'
def passwd = 'Giorgio!@!Daniel'
def template = "templates/${args[0]}.html"
def subject
if (args[0] == 'welcome') {
    subject = 'Welcome to the 2b4me Contest'
} else if (args[0] == 'winners') {
    subject = '2b4me Contest Winners Published'
}

def props = new Properties()
props.put('mail.smtp.host', host)
props.put('mail.smtp.user', user)
props.put('mail.smtp.port', port)
props.put('mail.smtp.auth', 'true')

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
        
        def body = buffer.toString()
        def session = Session.getInstance(props, null)
        def msg = new MimeMessage(session)
        msg.setContent(body, 'text/html')
        msg.setSubject(subject)
        msg.setFrom(new InternetAddress(user, userName))
        msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to))
        msg.addRecipient(MimeMessage.RecipientType.BCC, new InternetAddress('info@2b4me.com'))
        
        def transport = session.getTransport(method)
        
        println ("Connecting to ${host}:${port} over ${method} as ${user}")
        transport.connect(host, port.toInteger(), user, passwd)
        
        println ("Sending message to ${to}, subject ${subject}")
        transport.sendMessage(msg, msg.getAllRecipients())
        
        println ("Closing connection to ${host}:${port}")
        transport.close()
        
        println ('')
        
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