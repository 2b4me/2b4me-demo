package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class AdminController {

    def index() { }
    
    def addDeal() {
        def categories = Category.list()
        [categories: categories]
    }
    
    def addVendor() { }
    
    def topMenu() { }
    
    def sidebarMenu() { }
    
}
