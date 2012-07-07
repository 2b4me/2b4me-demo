package com.tobeforme.services

import com.tobeforme.domain.*
import java.util.regex.*

class ContestService {
    
    def mailService
    
    def processSignup(email) {
        def c = Contestant.findByEmail(email)
        
        if (!c) {
            c = new Contestant()
            c.email = email
            c.signupDate = new Date()
            c.ineligible = false
            c.entry = getNextEntry()
            c.save()
        }
        
        def emt = EmailTemplate.findByName('welcome')
        def content = setupVars(emt.content, [c.signupDate, c.entry])
        mailService.sendMail(c.email, 'Thank you for signing up!', content)
    }
    
    def setupVars(content, vars) {
        def i = 0
        return content.replaceAll(/#var/, { vars.get(i++) })
    }
    
    def synchronized getNextEntry() {
        def r = new Random(2746);
        def entry
        for (i in 0..Contestant.count()) {
            entry = String.format("%05d", r.nextInt(10000))
            if (entry == '00000') nextNum = '10000'
        }
        return entry
    }
    
}
