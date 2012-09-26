package com.tobeforme.services

import javax.mail.internet.AddressException
import javax.mail.internet.InternetAddress
import java.util.regex.*;

class ValidatorService {
    
    def validateEmailAddress(emailAddress) {
        if (!emailAddress || emailAddress == '') return false
        
        try {
            def ia = new InternetAddress(emailAddress)
        } catch (AddressException e) {
            return false
        }
        
        def tokens = emailAddress.split('@')
        return tokens.length == 2 &&
               tokens[0] != '' &&
               tokens[1] != ''
    }
    
    def validateName(firstName, lastName) {
        return firstName &&
               lastName &&
               !firstName.isEmpty() &&
               !lastName.isEmpty()
    }
    
    def validate() { return true }

}