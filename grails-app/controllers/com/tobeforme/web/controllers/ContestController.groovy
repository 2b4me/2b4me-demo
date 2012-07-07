package com.tobeforme.web.controllers

class ContestController {
    
    def contestService

    def index() {
        render new Date()
    }
    
    def signup() {
        try {
            contestService.processSignup(params.email)
            render 'success ' + new Date()
        } catch (Exception e) {
            log.debug e
            render 'error, check logs: ' + e
        }
    }
}
