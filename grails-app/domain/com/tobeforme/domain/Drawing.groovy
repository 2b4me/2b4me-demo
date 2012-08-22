package com.tobeforme.domain

class Drawing {
    
    Date drawingDate
    long seed
    
    static hasMany = [winners: Winners]

    static constraints = {
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'drawing_id_sequence']
    }
    
    String toString() {
        def sb = new StringBuilder()
        sb << "Drawing ran on ${drawingDate}\n"
        sb << "Randomizer seed was ${seed}\n"
        sb << '----------------------------------------------\n'
        sb << '\n'
        def i = 0
        winners.each { s ->
            sb << "Winners for prize: ${s.prize.name}\n"
            def x = ['First', 'Second', 'Third']
            s.winners.each { w ->
                sb << "First place:\t${w.email}\t${w.entry}\t${w.ineligible}\n"
                
            }
            sb << '\n'
        }
        return sb.toString()
    }
}
