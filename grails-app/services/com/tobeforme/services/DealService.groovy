package com.tobeforme.services

import com.tobeforme.domain.*
import java.text.SimpleDateFormat

class DealService {

    def saveDeal(data) {
        log.debug "saving deal, vendor id: ${data.vendorId}"
        def vendor = Vendor.get(new Long(data.vendorId))
        def category = Category.get(new Long(data.categoryId))
        def deal = new Deal(
            shortName: data.shortName,
            hoverTitle: data.hoverTitle,
            hoverTeaser: data.hoverTeaser,
            title: data.title,
            teaser: data.teaser,
        	originalPrice: parsePrice(data.originalPrice),
            price: parsePrice(data.price),
        	effective: parseDate(data.effectiveDate),
        	expiration: parseDate(data.expirationDate),
        	fullDescription: data.fullDescription,
        	vendor: vendor,
        	category: category
        ).save(failOnError: true)
        return deal
    }
    
    def parsePrice(price) {
        return new Double(price)
    }
    
    def parseDate(date) {
        return new SimpleDateFormat('MM/dd/yyyy').parse(date)
    }
}
