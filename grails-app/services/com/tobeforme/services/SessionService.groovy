package com.tobeforme.services

import java.util.UUID

class SessionService {

    def generateSession() {
        return UUID.randomUUID().toString()
    }
}
