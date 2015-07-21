package com.sra

class Generic {
	
	
	int wholeNumber
	double decimal 
	boolean trueFalse
	String string
	String mylist
	User user //many to one relationship
	//static hasOne = [user: User] // one to one relationship
	//static hasMany = [user: User] // one to many 
	
    static constraints = {
		string()
		wholeNumber()
		decimal()
		trueFalse()
		mylist inList: ["Ahmed", "Scott", "Brian", "Graham"]
    }
}
