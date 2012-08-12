package com.tobeforme.web.controllers

import com.tobeforme.domain.*
import java.util.regex.Matcher
import java.util.regex.Pattern

class ContestController {
    
    def contestService

    def index() {
        render new Date()
    }
    
    def signup() {
        response.setHeader('Access-Control-Allow-Origin', '*')
        try {
            contestService.processSignup(params.email.toLowerCase())
            render 'success ' + new Date()
        } catch (Exception e) {
            render 'error: ' + e
        }
    }
    
    def list() {
        [contestants: Contestant.list()]
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
}
