import com.sra.Role
import com.sra.User
import com.sra.UserRole
import org.springframework.security.oauth2.provider.BaseClientDetails

class BootStrap {

	def springSecurityService
	def clientDetailsService
	def searchableService
	def DBBackupService

	def createUser(user,pass,role,email) {
		def theUser = new User(username:user,password:pass,email:email)
		theUser.save(flush:true)
		UserRole.create theUser, role, true
		clientDetailsService.clientDetailsStore << [(user): new BaseClientDetails()]
	}

	def init = { servletContext ->
		log.info 'Boostrapping'
		TimeZone.setDefault(TimeZone.getTimeZone("America/New_York"))
		try {
			if (UserRole.list().size() == 0) { //only load on empty DB
				def adminRole = new Role(authority:'ROLE_ADMIN').save(flush:true)
				def userRole = new Role(authority:'ROLE_USER').save(flush:true)
	
				createUser('admin','stbadmin2014',adminRole,'rad@sra.com')
				createUser('user','stbuser2014',userRole,'rad@sra.com')
			}
		} catch (Exception e) {
			log.error(e.toString())
			e.printStackTrace()
		}
		DBBackupService.registerListener()
	}
	def destroy = {
		
	}
}
