package com.tobeforme.web.controllers

import com.tobeforme.domain.*
import java.util.regex.Matcher
import java.util.regex.Pattern

class ContestController {
    
    def contestService
    def mailService

    def index() {
        
    }
    
    def signup() {
        try {
            contestService.processSignup(params.email.toLowerCase(), params.zipCode.toLowerCase())
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
                if (!it.ineligible) {
                    def content = contestService.setupVars(
                        EmailTemplate.findByName('winners').content,
                        [it.entry]
                    )
                    mailService.sendMail(it.email, '2b4me Contest Winners Published', content)
                    this.sleep(2000)
                } else {
                    log.debug "Didn't send email to ${it.email} because they are not eligible"
                }
                
            }
        }
        render 'Process started, check logs for details'
    }
    
    def claimPrize() {
        if (!params.formSubmitted) return
        
        if (params.entry == '' || params.name == '' || params.prize == '' || params.date == '') {
            throw new IllegalStateException('All input boxes must be filled')
        }
        
        def c = Contestant.findByEntry(params.entry)
        def content = contestService.setupVars(
            EmailTemplate.findByName('claim').content,
            [params.name, params.prize, params.date]
        )
        runAsync {
            log.debug 'Sending claim email now to c.email...'
            mailService.sendMail(c.email, 'Congratulations from 2b4me.com', content)
            log.debug 'Done sending claim email'
        }
        render "Process started, check logs for details"
    }
    
    def selectWinners() {
        def contestants = Contestant.list()
        def prizes = Prize.list()

        if (prizes.size() * 10 > contestants.size()) {
            throw new IllegalStateException("The number of contestants " +
                "(${contestants.size()}) exceeded " +
                "the number of prizes times ten (${prizes.size() * 10}). " +
                "Reduce the number of prizes to " +
                (int)Math.floor(contestants.size()/10) + " or less.")
        }

        def winners = []
        def datetime = new Date()
        def seed = datetime.getTime()
        def r = new java.util.Random(seed)
        def limit = prizes.size() * 3

        while (winners.size() < limit) {
            def w = contestants.get(r.nextInt(contestants.size()))
            if (!winners.contains(w)) winners << w
        }
        
        // save the results to the database
        def counter = 0
        def d  = new Drawing(drawingDate: datetime, seed: seed, winners: [])
        prizes.each { p ->
            def w = new Winners(prize: p, winners: [])
            for (i in 0..2) {
                w.winners << winners.get(counter++)
            }
            def s = w.save()
            log.debug s
            d.winners << w
        }
        d.save()
        
        render d.toString()
        
    }
    
    def prizes() {
        [prizes: Prize.list()]
    }
    
    def addPrize() {
        if (!params.formSubmitted) return
        
        if (params.name == '') {
            throw new IllegalStateException('All input boxes must be filled')
        }
        
        def p = new Prize(name: params.name)
        p.save()
        render "Prizes added"
    }
    
}
