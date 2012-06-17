package com.tobeforme.services

import java.util.Random

class VoucherNumberGeneratorService {
    
    static transactional = false
    
    def generator1 = new Random()
    def generator2 = new Random()

    def getNext(vendorCode, userCode) {
        def x = String.format("%04d", Math.abs(generator1.nextInt(1000)))
        def y = String.format("%03d", Math.abs(generator2.nextInt(100)))
        return (vendorCode + x + y + userCode).toString().toUpperCase()
    }
}
