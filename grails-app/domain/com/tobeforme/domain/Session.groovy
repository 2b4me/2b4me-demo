package com.tobeforme.domain

import groovy.json.JsonBuilder
import groovy.json.JsonSlurper

class Session implements Serializable {
    
    String sessionId
    String userId
    Date sessionDate
    boolean admin
    String flash
    
    static constraints = {
        sessionId unique: true
        userId nullable: true
        admin nullable: true
        flash nullable: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'session_id_sequence']
    }
    
    def writeFlash(Map m) {
        def b = new JsonBuilder()
        b m
        log.debug "Writing to flash: ${b}"
        flash = b.toString()
    }
    
    def readFlash() {
        def s = new JsonSlurper()
        if (flash && !flash.isEmpty()) {
            return s.parseText(flash)
        } else {
            return null
        }
    }
}
