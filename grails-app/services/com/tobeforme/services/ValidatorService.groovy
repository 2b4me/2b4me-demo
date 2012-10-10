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
        def tokens = emailAddress.split('@')
        }
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
    
    def validateNotBlank(value) {
        if (!value) return false
        if (value == '') {
            return false
        } else {
            return true
        }
    }
    
    def validateNull(value) {
        if (value == null) {
            return true
        } else {
            return false
        }
    }
    
    def validateZipCode(zipCode) {
        if (!zipCode) return false
        def p = ~/^\d{5}(-\d{4})?$/
        return p.matcher(zipCode).matches()
    }
    
    def validateCreditCard(ccNum, type) {
        if (!ccNum) return false
        def p    
        switch (type) {
            case CreditCardService.VISA:
                p = ~/^4[0-9]{12}(?:[0-9]{3})?$/
                break
            case CreditCardService.MC:
                p = ~/^5[1-5][0-9]{14}$/
                break
            case CreditCardService.AMEX:
                p = ~/^3[47][0-9]{13}$/
                break
            case CreditCardService.DC:
                p = ~/^3(?:0[0-5]|[68][0-9])[0-9]{11}$/
                break
            case CreditCardService.DISC:
                p = ~/^6(?:011|5[0-9]{2})[0-9]{12}$/
                break
            case CreditCardService.JCB:
                p = ~/^(?:2131|1800|35\d{3})\d{11}$/
                break
            default:
                return false
        }
        return p?.matcher(ccNum).matches()
    }
    
    def validateCreditCardExpDate(ccExp) {
        if (!ccExp) return false
        def p = ~/^(0[1-9]|1[012])[-/.]\d\d$/
        return p?.matcher(ccNum).matches()
    }

}