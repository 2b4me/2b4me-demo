import javax.mail.internet.*
import javax.mail.*

def host = 'mail.2b4me.com'
def port = '25'
def user = 'info@2b4me.com'
def passwd = 'Giorgio!@!Daniel'

def props = new Properties()
props.put('mail.smtp.host', host)
props.put('mail.smtp.user', user)
props.put('mail.smtp.port', port)
props.put('mail.smtp.starttls.enable', 'true')
props.put('mail.smtp.auth', 'true')

def session = Session.getInstance(props, null)
def msg = new MimeMessage(session)

def to = 'daniel@silvanolte.com'
def subject = 'test'
def body = 'hello, world'

msg.setText(body)
msg.setSubject(subject)
msg.setFrom(new InternetAddress(user))
msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to))

def transport = session.getTransport("smtp")

println ("Connecting to Gmail")
transport.connect(host, port.toInteger(), user, passwd)

println ("Sending message")
transport.sendMessage(msg, msg.getAllRecipients())

println ("Closing connection to Gmail")
transport.close()