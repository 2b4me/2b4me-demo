package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class ContestController {
    
    def contestService

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
    
    def list() {
        [contestants: Contestant.list()]
    }
}
