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
}
