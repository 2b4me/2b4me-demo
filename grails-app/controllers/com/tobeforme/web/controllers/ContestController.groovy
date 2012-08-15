package com.tobeforme.web.controllers

import com.tobeforme.domain.*
import java.util.regex.Matcher
import java.util.regex.Pattern

class ContestController {
    
    def contestService
    def mailService

    def index() {
        render new Date()
    }
    
    def signup() {
        try {
            contestService.processSignup(params.email.toLowerCase())
            render 'success ' + new Date()
        } catch (Exception e) {
            render 'error: ' + e
        }
    }
    
    def signupProxy() {
        [email: params.email]
    }
    
    def list() {
        [contestants: Contestant.list(sort: 'signupDate', order: 'asc')]
    }
    
    def eligible() {
        def c = Contestant.get(params.id)
        c.ineligible = false
        c.ineligibilityReason = ''
        c.save()
        render 'success'
    }
    
    def ineligible() {
        def c = Contestant.get(params.id)
        c.ineligible = true
        c.ineligibilityReason = params.reason
        c.save()
        render 'success'
    }
    
    def changeNumber() {
        def validator = ~/[0-9][0-9][0-9][0-9][0-9]/
        if (validator.matcher(params.entry).matches()) {
            def c = Contestant.get(params.id)
            c.entry = params.entry
            c.save()
            render 'success'
        } else {
            render 'error'
        }
    }
    
    def deleteContestant() {
        if (params.password != 'CasaLarios2012!') {
            render 'not allowed'
            return
        }
        def c = Contestant.get(params.id)
        if (c) {
            c.delete()
            render 'it is done'
        } else {
            render 'id not found'
        }
    }
    
    def nextEntry() {
        if (params.cnum) {
            render contestService.getNextEntry(new Integer(params.cnum))
        } else {
            render contestService.getNextEntry()
        }
    }
    
    def testMail() {
        def success = mailService.sendMail('daniel@silvanolte.com', 'test email', 'this is a test email')
        if (success) {
            render 'success'
        } else {
            render 'error'
        }
    }
    
    def templates() {
        [templates: EmailTemplate.list()]
    }
    
    def templateContent() {
        def e = EmailTemplate.get(params.id)
        if (!e) {
            throw new IllegalStateException('None found by id: ' + params.id)
        } else {
            render e.content
        }
    }
    
    def saveTemplateContent() {
        if (params.content.length() == 0) {
            throw new IllegalStateException('Template content cannot be empty')
        }
        def e = EmailTemplate.get(params.id)
        if (!e) {
            throw new IllegalStateException('None found by id: ' + params.id)
        } else {
            def unescapedContent = params.content
                .replace('&lt;','<')
                .replace('&gt;','>')
                .replace('&amp;','&')
            e.content = unescapedContent
            e.save()
            render e.content
        }
    }
    
    def newTemplate() {
        throw new UnsupportedOperationException(); // for now, until we're ready to finish this part
        
        if (params.name.length() == 0 || params.content.length() == 0) {
            throw new IllegalStateException('Template content cannot be empty')
        }
        def unescapedName = params.name
            .replace('&lt;','<')
            .replace('&gt;','>')
            .replace('&amp;','&')
        def unescapedContent = params.content
            .replace('&lt;','<')
            .replace('&gt;','>')
            .replace('&amp;','&')
            
        EmailTemplate e = new EmailTemplate();
        e.name = unescapedName
        e.content = unescapedContent
        e.save()
        
        render e.id
    }
    
    def winnersPublished() {
        def contestants = Contestant.list(sort: 'signupDate', order: 'asc')
        runAsync {
            contestants.each {
                def content = contestService.setupVars(
                    EmailTemplate.findByName('winners').content,
                    [it.entry]
                )
                mailService.sendMail(it.email, '2b4me Contest Winners Published', content)
                this.sleep(2000)
            }
        }
        render 'Process started, check logs for details'
    }
    
}
