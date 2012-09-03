package com.tobeforme.domain

import groovy.json.JsonBuilder
import groovy.json.JsonSlurper

class Session implements Serializable {
    
    String sessionId
    String userId
    Date sessionDate
    boolean admin
    String data
    
    static constraints = {
        sessionId unique: true
        userId nullable: true
        admin nullable: true
        data nullable: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'session_id_sequence']
    }
    
    def writeData(Map m) {
        def b = new JsonBuilder()
        b(m)
        data = b.toString()
    }
    
    def readData() {
        def s = new JsonSlurper()
        if (data && !data.isEmpty()) {
            return s.parseText(data)
        } else {
            return null
        }
    }
    
    String toString() {
        def json = new JsonBuilder() 
        json {
            sessionId sessionId
            userId userId
            admin admin
            data readData()
        }
        return json.toString()
    }
}
