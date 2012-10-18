package com.tobeforme.services

import com.tobeforme.domain.*
import java.util.*

class UserService {
    
    def generateRegistrationKey() {
        def decKey = Math.abs(new Random().nextInt(1048575)) // FFFFF max
        def hexString = Integer.toHexString(decKey).toUpperCase()
        def hexKey = ''
        if (hexString.length() < 5) {
            (0..(5-hexString.length())).each {
                hexKey = hexKey + '0'
            }
        }
        return hexKey + hexString
    }
    
    def sendConfirmationEmail(userId) {
        log.debug 'Starting async process to send confirmation email'
        runAsync {
            log.debug 'Start'
            def emt = EmailTemplate.findByName('confirm-registration')
            def user = User.get(userId)
            def content = setupVars(emt.content, [user.registrationKey, user.registrationKey])
            mailService.sendMail(c.email, 'Please confirm your account', content)
            log.debug 'End'
        }
    }
}
