package com.tobeforme.domain

class Purchase implements Serializable {
	
	Date bought
	Deal deal
	User buyer
	String voucher
	double price

    static constraints = {
        voucher unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [name: 'purchase_sequence', 
                    sequenceName: 'purchase_sequence',
                    initialValue: 1,
                    allocationSize: 1]
    }
    
}
