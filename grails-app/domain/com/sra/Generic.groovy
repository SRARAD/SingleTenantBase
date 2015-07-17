package com.sra

class Generic {
	
	
	int wholeNumber
	double decimal 
	boolean trueFalse
	String string
	String mylist
	
    static constraints = {
		string()
		wholeNumber()
		decimal()
		trueFalse()
		mylist inList: ["Ahmed", "Scott", "Brian", "Graham"]
    }
}
