package com.tobeforme.services

import com.tobeforme.domain.*
import java.text.SimpleDateFormat
import com.amazonaws.services.s3.model.*

class DealService {

    def amazonWebService

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
        
        // try and push the image to amazon
        def pushPhoto = { media, suffix ->
            def obm = new ObjectMetadata()
            obm.setContentLength(media.getSize())
            amazonWebService.s3.putObject(new PutObjectRequest(
                '2b4me-deals',
                "${data.shortName}-${suffix}.jpg",
                media.getInputStream(),
                obm
            ).withCannedAcl(CannedAccessControlList.PublicRead))
        }
        pushPhoto(data.detailPhoto, 'detail-photo')
        pushPhoto(data.sliderMainPhoto, 'slider-main-photo')
        pushPhoto(data.sliderPhoto, 'slider-photo')
        pushPhoto(data.browseDealsPhoto, 'browse-photo')
        pushPhoto(data.relatedDealPhoto, 'related-deal-photo')
        
        return deal
    }
    
    def parsePrice(price) {
        return new Double(price)
    }
    
    def parseDate(date) {
        return new SimpleDateFormat('MM/dd/yyyy').parse(date)
    }
}
