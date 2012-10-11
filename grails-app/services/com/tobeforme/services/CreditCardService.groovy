package com.tobeforme.services

class CreditCardService {
    
    static final int UNK  = 0
    static final int VISA = 1
    static final int MC   = 2
    static final int AMEX = 3
    static final int DC   = 4
    static final int DISC = 5
    static final int JCB  = 6

    def getCreditCardType(ccNum) {
        if (!ccNum) {
            return UNK
        }
        
        if (ccNum.startsWith('4')) {
            return VISA
        }
        
        if (ccNum.startsWith('51') ||
            ccNum.startsWith('52') ||
            ccNum.startsWith('53') ||
            ccNum.startsWith('54') ||
            ccNum.startsWith('55')) {
            return MC
        }
        
        if (ccNum.startsWith('34') ||
            ccNum.startsWith('37')) {
            return AMEX
        }
        
        if (ccNum.startsWith('300') ||
            ccNum.startsWith('301') ||
            ccNum.startsWith('302') ||
            ccNum.startsWith('303') ||
            ccNum.startsWith('304') ||
            ccNum.startsWith('305') ||
            ccNum.startsWith('36') ||
            ccNum.startsWith('38')) {
            return DC
        }
        
        if (ccNum.startsWith('6011') ||
            ccNum.startsWith('65')) {
            return DISC
        }
        
        if (ccNum.startsWith('2131') ||
            ccNum.startsWith('1800')) {
            return JCB
        }
        
        return UNK
    }
}
