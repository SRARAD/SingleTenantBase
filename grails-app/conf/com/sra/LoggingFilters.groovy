package com.sra

import org.apache.commons.logging.LogFactory
import org.springframework.security.core.context.SecurityContextHolder

class LoggingFilters {
	
	def log = LogFactory.getLog('com.sra.LoggingFilters')

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				log.info 'User: ' + SecurityContextHolder.getContext().getAuthentication().getName() + ', Controller: ' + controllerName + ', Action: ' + actionName
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
