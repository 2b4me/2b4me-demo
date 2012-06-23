package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class AdminController {

    def index() {
        render status: 403, text: 'Not authorized'
    }
    
    def addDealFlow = {
        
        start {
            action {
                [categories: Category.list()]
            }
            on('success').to 'disabled'
        }
        
        details {
            on('continue') {
                
            }.to 'images'
        }
        
        images {
            on('continue') {
                [vendors: Vendor.list()]
            }.to 'vendor'
            on('back').to 'details'
        }
        
        vendor {
            on('continue') {
                
            }.to 'review'
            on('back').to 'images'
        }
        
        review {
            on('continue') {
                
            }.to 'confirmation'
            on('details').to 'details'
            on('images').to 'images'
            on('back').to 'vendor'
        }
        
        confirmation()
        
        disabled()
        
    }
    
    def addVendor() {
        render status: 403, text: 'Not authorized'
    }
    
    def topMenu() { }
    
    def sidebarMenu() { }
    
}

class DealDetailsCommand {
    String shortName
    
}

class DealImagesCommand {
    
}

class DealVendorCommand {
    
}
