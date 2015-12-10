grails.project.groupId = appName
grails.mime.file.extensions = true
grails.mime.use.accept.header = false
grails.mime.types = [
	all:			'*/*',
	atom:			'application/atom+xml',
	css:			'text/css',
	csv:			'text/csv',
	form:			'application/x-www-form-urlencoded',
	html:			['text/html','application/xhtml+xml'],
	js:				'text/javascript',
	json:			['application/json', 'text/json'],
	multipartForm:	'multipart/form-data',
	rss:			'application/rss+xml',
	text:			'text/plain',
	csv: 			'text/csv',
	pdf: 			'application/pdf',
	rtf: 			'application/rtf',
	excel: 			'application/vnd.ms-excel',
	ods: 			'application/vnd.oasis.opendocument.spreadsheet',
	hal:			['application/hal+json','application/hal+xml'],
	xml:			['text/xml', 'application/xml']
]

grails.views.default.codec = "none"
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
grails.views.gsp.sitemesh.preprocess = true
grails.scaffolding.templates.domainSuffix = 'Instance'

grails.json.legacy.builder = false
grails.enable.native2ascii = true
grails.spring.bean.packages = []
grails.web.disable.multipart=false

grails.exceptionresolver.params.exclude = ['password']

grails.hibernate.cache.queries = false

environments {
	development {
		grails.logging.jul.usebridge = true
	}
	devdeploy {
		grails.logging.jul.usebridge = false
	}
	production {
		grails.logging.jul.usebridge = false
	}
}

log4j = {
	appenders {
		console name: 'stdout', threshold: org.apache.log4j.Level.ERROR
		rollingFile name: 'info', file: 'logs/info.log', layout: pattern(conversionPattern: '[%p] %d{yyyy-MM-dd HH:mm:ss} %c{2} - %m%n'), threshold: org.apache.log4j.Level.INFO
		rollingFile name: 'warn', file: 'logs/warn.log', layout: pattern(conversionPattern: '[%p] %d{yyyy-MM-dd HH:mm:ss} %c{2} - %m%n'), threshold: org.apache.log4j.Level.WARN
		rollingFile name: 'activity', file: 'logs/activity.log', layout:pattern(conversionPattern: '%d{dd-MM-yyyy HH:mm:ss} - %m%n'), threshold: org.apache.log4j.Level.INFO
	}

	warn 'warn': [
		'grails.app.controllers.com.sra',
		'grails.app.services.com.sra',
		'grails.app.conf.com.sra',
		'grails.app.domain.com.sra'
	]

	info 'info': [
		'grails.app.controllers.com.sra',
		'grails.app.services.com.sra',
		'grails.app.conf.com.sra',
		'grails.app.domain.com.sra'
	]

	info	activity: ['grails.app.filters.com.sra.LoggingFilters']
	off 'org.grails.plugin.resource.ResourceMeta'
}

grails.resources.resourceLocatorEnabled = true

grails.app.context="/"

grails.plugin.springsecurity.providerNames = [
	'daoAuthenticationProvider',
	'anonymousAuthenticationProvider',
	'rememberMeAuthenticationProvider'
]

grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.sra.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.sra.UserRole'
grails.plugin.springsecurity.authority.className = 'com.sra.Role'

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/**':								['permitAll'],
	'/home/health':						['permitAll'],
	'/home/**':							['ROLE_USER', 'ROLE_ADMIN']
]
