package com.tobeforme.domain

class Media {
    
    String name
    byte[] data

    static constraints = {
        name unique: true
        data maxSize: 1024 * 1024 * 1 // limit size to 1MB
    }
}
