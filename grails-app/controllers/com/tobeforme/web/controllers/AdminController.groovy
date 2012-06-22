package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class AdminController {

    def index() { }
    
    def addDealFlow = {
        
        start {
            action {
                [categories: Category.list()]
            }
            on('success').to 'details'
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
        
    }
    
    def addVendor() { }
    
    def topMenu() { }
    
    def sidebarMenu() { }
    
}

