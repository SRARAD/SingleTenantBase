package com.sra

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN","ROLE_USER"])
class HomeController {

	def index() { }
	
	def rad() {
		[md: grailsApplication.config.rad.about.url.toURL().text]
	}
	
	def health() {
		render(status: 200)
	}
	
	def changePassword () {
		render(view:"chpass")
	}
	
	def springSecurityService
	def passwordEncoder
	def DBBackupService
	
	def updatePassword = {
		String username = springSecurityService.principal.username
		if (!username) {
		   flash.message = 'Sorry, an error has occurred'
		   render view: 'chpass'
		   return
		}
		String password = params.password
		String newPassword = params.password_new
		String newPassword2 = params.password_new_2
		if (!password || !newPassword || !newPassword2 || newPassword != newPassword2) {
		   flash.message = 'Please enter your current password and a valid new password'
		   render view: 'chpass'
		   return
		}
	 
		User user = User.findByUsername(username)
		if (!passwordEncoder.isPasswordValid(user.password, password, null /*salt*/)) {
		   flash.message = 'Current password is incorrect'
		   render view: 'chpass'
		   return
		}
	 
		if (passwordEncoder.isPasswordValid(user.password, newPassword, null /*salt*/)) {
		   flash.message = 'Please choose a different password from your current one'
		   render view: 'chpass'
		   return
		}
	 
		user.password = springSecurityService.encodePassword(newPassword)
		user.passwordExpired = false
		user.save() // if you have password constraints check them here
	 
		redirect controller: 'home'
	 }
	
	@Secured("ROLE_ADMIN")
	def dbbackup() {
		DBBackupService.s3Backup()
		flash.message = "Database has been backed up to S3"
		redirect(controller: "home", action: "index")
	}
}

