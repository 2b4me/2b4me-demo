package com.tobeforme.services

import com.tobeforme.domain.*

class VendorService {

    def saveVendor(data) {
        def va = new VendorAddress(
            address1: data.vendorAddress1,
            address2: data.vendorAddress2,
            city: data.vendorCity,
            state: data.vendorState,
            postalCode: data.vendorZipCode,
            countryCode: ''
        ).save(failOnError: true)
        def v = new Vendor(
            code: data.vendorCode,
            name: data.vendorName,
            address: va
        ).save(failOnError: true)
        return v
    }
}
