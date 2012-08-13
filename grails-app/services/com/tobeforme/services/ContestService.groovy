package com.tobeforme.services

import com.tobeforme.domain.*
import java.util.regex.*
import org.springframework.beans.factory.InitializingBean

class ContestService implements InitializingBean {
    
    def mailService
    
    def numbers
    
    def processSignup(email) {
        runAsync {
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
            def content = setupVars(emt.content, [new Date(c.signupDate.time), c.entry])
            mailService.sendMail(c.email, 'Thank you for signing up!', content)
        }
    }
    
    def setupVars(content, vars) {
        def i = 0
        return content.replaceAll(/#var/, { vars.get(i++) })
    }
    
    def getNextEntry() {
        return getNextEntry(null)
    }
    
    def getNextEntry(cnum) {
        if (cnum) {
            return numbers.get(cnum)
        } else {
            return numbers.get(Contestant.count())
        }
    }
    
    void afterPropertiesSet() {
        numbers = []
        def r = new Random(2746);
        while (numbers.size() < 10000) {
            def entry = String.format("%05d", r.nextInt(10000))
            if (entry == '00000') entry = '10000'
            if (!numbers.contains(entry)) { numbers << entry }
        }
    }
    
}
