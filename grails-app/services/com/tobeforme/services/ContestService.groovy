package com.tobeforme.services

import com.tobeforme.domain.*
import java.util.regex.*
import org.springframework.beans.factory.InitializingBean

class ContestService implements InitializingBean {
    
    def mailService
    
    def numbers
    
    def processSignup(email, zipCode) {        
        def c = Contestant.findByEmail(email)
        
        if (!c) {
            c = new Contestant()
            c.email = email
            c.signupDate = new Date()
            c.ineligible = false
            c.entry = getNextEntry()
            c.zipCode = zipCode
            c.save()
        } else {
            log.debug "Existing user's zip code: '${c.zipCode}'"
            if (c.zipCode == null) {
                log.debug "Zip code either null or blank, update value with '${zipCode}'"
                c.zipCode = zipCode
                c.save()
            }
        }
        
        log.debug 'Starting async process to send mail'
        runAsync {
            log.debug 'Start'
            def emt = EmailTemplate.findByName('welcome')
            def content = setupVars(emt.content, [new Date(c.signupDate.time), c.entry])
            mailService.sendMail(c.email, 'Thank you for signing up!', content)
            log.debug 'End'
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
    
    def generateContestModel() {
        def drawings = Drawing.list()
        def drawingCount = drawings.size()
        def contestResult = ContestResult.list(sort: 'id', order: 'asc')
        
        def storeWinner = { store, cr, drawingDate, prio ->
            def x = [:]
            x.prio = cr.prize.prio + prio
            x.prize = cr.prize.name
            x.prizeDesc = cr.prize.description
            x.winningNumber = cr.contestNum
            x.drawingDate = drawingDate
            store << x
        }
        
        def d
        def currentWinnersDrawingDate
        
        def currentWinners = []
        d = drawings.get(drawingCount-1)
        currentWinnersDrawingDate = d.drawingDate
        ContestResult.findAllBySeed(d.seed).each {
            storeWinner(currentWinners, it, d.drawingDate, 10)
        }
        
        def pastWinners = []
        d = drawings.get(drawingCount-2)
        ContestResult.findAllBySeed(d.seed).each {
            storeWinner(pastWinners, it, d.drawingDate, 20)
        }
        d = drawings.get(drawingCount-3)
        ContestResult.findAllBySeed(d.seed).each {
            storeWinner(pastWinners, it, d.drawingDate, 30)
        }
        d = drawings.get(drawingCount-4)
        ContestResult.findAllBySeed(d.seed).each {
            storeWinner(pastWinners, it, d.drawingDate, 40)
        }
        
        currentWinners = currentWinners.sort { a,b -> a.prio <=> b.prio }
        pastWinners = pastWinners.sort { a,b -> a.prio <=> b.prio }
        
        def contest = [:]
        contest.currentWinners = currentWinners
        contest.pastWinners = pastWinners
        contest.currentWinnersDrawingDate = currentWinnersDrawingDate
        return contest
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