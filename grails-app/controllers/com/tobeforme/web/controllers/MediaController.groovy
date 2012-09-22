package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class MediaController {

    def index() {
        render 'Media Controller'
    }
    
    def load() {
        def m = Media.get(params.id)
        response.setContentType(m.contentType)
        response.outputStream.write(m.data)
    }
    
    def loadBytes() {
        def m = Media.get(params.id)
        render "${m.data[0]} ${m.data[1]} ${m.data[2]} ${m.data[3]} ${m.data[4]}"
    }
    
    def loadRemoteTestImage() {
        def mis = new java.net.URL('http://silvanolte.com/images/2b4me-sample-image.jpeg').openStream()
        def bos = new java.io.ByteArrayOutputStream()
        def bb
        while ((bb = mis.read()) != -1) { bos.write(bb) }
        def data = bos.toByteArray()
        response.setContentType('image/jpeg')
        response.outputStream.write(data)
    }

    def loadRemoteTestImageBytes() {
        def mis = new java.net.URL('http://silvanolte.com/images/2b4me-sample-image.jpeg').openStream()
        def bos = new java.io.ByteArrayOutputStream()
        def bb
        while ((bb = mis.read()) != -1) { bos.write(bb) }
        def m = [:]
        m.data = bos.toByteArray()
        render "${m.data[0]} ${m.data[1]} ${m.data[2]} ${m.data[3]} ${m.data[4]}"
    }
    
    def compare() {
        def mis = new java.net.URL('http://silvanolte.com/images/2b4me-sample-image.jpeg').openStream()
        def bos = new java.io.ByteArrayOutputStream()
        def bb
        while ((bb = mis.read()) != -1) { bos.write(bb) }
        def data = bos.toByteArray()
        render "${data[0]} ${data[1]} ${data[2]} ${data[3]} ${data[4]}"
    }
}
