package com.sra

class Generic {
	
	
	int wholeNumber
	double decimal 
	boolean trueFalse
	String string
	String mylist
	//User user //many to one relationship
	static hasOne = [subGeneric: SubGeneric] // one to one relationship
	//static hasMany = [subGeneric: SubGeneric] // one to many 
	
    static constraints = {
		string()
		wholeNumber()
		decimal()
		trueFalse()
		mylist inList: ["Ahmed", "Scott", "Brian", "Graham"]
    }
}
