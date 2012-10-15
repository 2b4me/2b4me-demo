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
    
    def promoUpdate() {
        if (!params.formSubmit) {
            return [renderForm: true]
        }
        
        def drawings = Drawing.list(sort: 'drawingDate', order: 'desc')
        
        def currentWinners = [:]
        def cd = drawings.get(0)
        currentWinners.date = cd.drawingDate
        currentWinners.winners = [:]
        cd.winners.each {
            def prizeName = it.prize.name
            def winningEntry = it.winners.iterator().next().entry // first place winner
            currentWinners.winners.add(prizeName, winningEntry)
        }
        
        return [upcomingDate: params.upcomingDate, currentWinners: currentWinners]
    }
    
    def prizes() {
        [prizes: Prize.list(sort: 'prio', order: 'asc')]
    }
    
    def addPrize() {
        if (!params.formSubmitted) return
        
        if (params.name == '' || params.description == '') {
            throw new IllegalStateException('All input boxes must be filled')
        }
        
        def p = new Prize(name: params.name, description: params.description)
        p.save()
        render "Prizes added"
    }
    
    def editPrize() {
        if (!params.id) {
            throw new IllegalStateException('id parameter missing')
        }
        
        def prize = Prize.get(params.id)
        def errors = [:]
        
        if (!params.submit) {
            return [prize: prize, errors: errors]
        }
        
        if (params.submit == 'Cancel') {
            redirect controller: 'contest', action: 'prizes'
            return
        }
        
        def data = [:]
        data.id = params.id
        data.prio = params.prio
        data.name = params.name
        data.description = params.description
        
        def xPrize = Prize.findByPrio(params.prio)
        if (xPrize && xPrize.id.toString() != prize.id.toString()) {
            errors.put 'prio', "Priority must be unqiue; the value ${params.prio} is already taken"
        }
        
        if (errors.size() > 0) {
            return [prize: data, errors: errors]
        }
        
        log.debug "Old prio: ${prize.prio} | New prio: ${params.prio}"
        log.debug "Old prio: ${prize.name} | New prio: ${params.name}"
        log.debug "Old prio: ${prize.description} | New prio: ${params.description}"
        
        prize.prio = Integer.parseInt(params.prio, 10)
        prize.name = params.name
        prize.description = params.description
        prize.save(failOnError: true)
        
        redirect controller: 'contest', action: 'prizes'
    }
    
    def drawingDate() {
        def errors = [:]
        def data = [:]
        def nd = NextDrawing.get(1)
        
        if (!params.submit) {
            return [errors: errors, data: data, nextDrawingDate: nd.date]
        }
        
        data.newDate = params.newDate
        
        try {
            nd.date = new java.text.SimpleDateFormat('MM/dd/yyyy').parse(params.newDate)
            nd.save()
            return [errors: errors, data: [:], nextDrawingDate: nd.date]
        } catch (Exception e) {
            errors.put 'newDate', "There was an error trying to update the date: ${e}"
            return [errors: errors, data: data, nextDrawingDate: nd.date]
        }
    }
    
}
