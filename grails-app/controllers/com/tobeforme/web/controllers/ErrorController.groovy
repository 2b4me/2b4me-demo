package com.tobeforme.web.controllers

class ErrorController {

    def serverError() {
        def env = grails.util.GrailsUtil.environment
        
        if (env == "production") {
            render(view:'/serverError')
        } else {
            render(view:'/error')
        }
    }
    
    def notFound() {
        render(view:'/notFound')
    }
    
}
