import com.sra.Role
import com.sra.User
import com.sra.UserRole

class BootStrap {

	def springSecurityService
	def searchableService

	def createUser(user,pass,role) {
		def theUser = new User(username:user,password:pass)
		theUser.save(flush:true)
		UserRole.create theUser, role, true
	}

	def init = { servletContext ->
		log.info 'Boostrapping'
		TimeZone.setDefault(TimeZone.getTimeZone("America/New_York"))
		try {
			if (UserRole.list().size() == 0) { //only load on empty DB
				def adminRole = new Role(authority:'ROLE_ADMIN').save(flush:true)
				def userRole = new Role(authority:'ROLE_USER').save(flush:true)
	
				createUser('admin','stbadmin2014',adminRole)
				createUser('user','stbuser2014',userRole)
			}
		} catch (Exception e) {
			log.error(e.toString())
			e.printStackTrace()
		}
	}
	def destroy = {
		
	}
}
