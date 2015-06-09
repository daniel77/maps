package alo

class Realty {
	
	String name
	String address
	String photos
	 
    static constraints = {
		name blank:false
		address blank:false
		photos blank:false
    }
}
