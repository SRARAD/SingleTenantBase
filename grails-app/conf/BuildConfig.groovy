grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6

grails.project.dependency.resolver = "maven"

grails.project.dependency.resolution = {
	inherits("global") {
	}
	log "error"
	checksums true
	legacyResolve false

	repositories {
		inherits true

		grailsPlugins()
		grailsHome()
		grailsCentral()

		mavenLocal()
		mavenCentral()

		mavenRepo "http://repo.spring.io/milestone/"
		mavenRepo "http://download.java.net/maven/2/"
		mavenRepo "http://repo.grails.org/grails/core"
	}

	dependencies {
		runtime "com.amazonaws:aws-java-sdk:1.7.3"
		runtime 'mysql:mysql-connector-java:5.1.22'

	}

	plugins {
		runtime ":hibernate4:4.3.8.1"
		compile ":asset-pipeline:2.3.2"
		compile ":quartz:1.0.1"
		compile ":scaffolding:2.1.2"
		compile ":searchable:0.6.9"
		compile ":executor:0.3"
		compile ":markdown:1.1.1"

		build ':tomcat:7.0.55.2'
		compile ":spring-security-ui:1.0-RC2"
		compile ":spring-security-core:2.0-RC5"
		compile ":jquery-ui:1.10.4"

	}
}
codenarc.reports = {
	MyXmlReport('xml') {
		outputFile = 'target/CodeNarcReport.xml'
		title = 'SingleTenantBase XML Report'
	}


	MyHtmlReport('html') {
		outputFile = 'target/CodeNarcReport.html'
		title = 'SingleTenantBase html Report'
	}
}
codenarc.ruleSetFiles="file:grails-app/conf/CodeNarcRules.groovy"

codenarc.properties = {
	GrailsPublicControllerMethod.enabled = false
	EmptyIfStatement.priority = 1
}

codenarc.maxPriority1Violations = 50
codenarc.maxPriority2Violations = 100
codenarc.maxPriority3Violations = 100

codenarc.systemExitOnBuildException = false