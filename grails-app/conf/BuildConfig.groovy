grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

// uncomment (and adjust settings) to fork the JVM to isolate classpaths
//grails.project.fork = [
//   run: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256]
//]

grails.project.dependency.resolver = "maven"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
		// Set possible config locations
		def loc = ['../UserConfig.groovy', 'webapps/ROOT/Jenkins.groovy'].grep { new File(it).exists() }.first();
		def config = new ConfigSlurper(grailsSettings.grailsEnv).parse(new File(loc).toURI().toURL())

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()
		
		mavenRepo('http://artifactory.srarad.com:8080/artifactory/SRA') {
			auth([
				realm: "Artifactory Realm",
				username: config.artifactory.username,
				password: config.artifactory.password
			])
        }
		mavenRepo "http://repo.spring.io/milestone/"
		mavenRepo "http://download.java.net/maven/2/"
		mavenRepo "http://repo.grails.org/grails/core"

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
		runtime "com.amazonaws:aws-java-sdk:1.7.3"
        runtime 'mysql:mysql-connector-java:5.1.22'
		
    }

    plugins {
        compile ":hibernate:3.6.10.17"
        runtime ":resources:1.2"
		compile ":quartz:1.0.1"
		compile ":scaffolding:2.0.3"
		compile ":searchable:0.6.7"
		compile ":executor:0.3"

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.5"

        build ':tomcat:7.0.54'
        compile ':cache:1.1.1'
		compile ":spring-security-ui:1.0-RC2"
		compile ":spring-security-core:2.0-RC4"
		compile ":spring-security-oauth2-provider:1.0.5.2"
		compile ":export:1.6"
		compile ":codenarc:0.21"
		compile ":srasaml:0.2.1"
		compile ":db-backups:0.2"
    }
}
codenarc.reports = {
	// Each report definition is of the form:
	//    REPORT-NAME(REPORT-TYPE) {
	//        PROPERTY-NAME = PROPERTY-VALUE
	//        PROPERTY-NAME = PROPERTY-VALUE
	//    }
	
    // uncomment this section if you want to generate xml report  
	MyXmlReport('xml') {                    // The report name "MyXmlReport" is user-defined; Report type is 'xml'
		outputFile = 'target/CodeNarcReport.xml'  // Set the 'outputFile' property of the (XML) Report
		title = 'SingleTenantBase XML Report'             // Set the 'title' property of the (XML) Report
	}
	
	
	MyHtmlReport('html') {                  // Report type is 'html'
		outputFile = 'target/CodeNarcReport.html'
		title = 'SingleTenantBase html Report'
	}
}
codenarc.ruleSetFiles="file:grails-app/conf/CodeNarcRules.groovy"
//example of configuring the Codenarc properties
codenarc.properties = {
	// Each property definition is of the form:  RULE.PROPERTY-NAME = PROPERTY-VALUE
	GrailsPublicControllerMethod.enabled = false
	EmptyIfStatement.priority = 1
}
//set the maximum number of priority X violations allowed without causing a failure.
codenarc.maxPriority1Violations = 50
codenarc.maxPriority2Violations = 100
codenarc.maxPriority3Violations = 100

//controls what happens when the maximum number of violations are exceeded
codenarc.systemExitOnBuildException = false





/*
codenarc{
	ruleSetFiles = "file:grails-app/conf/CodeNarcRules.groovy" // Ruleset file path
	//maxPriority2Violations = 1
	//systemExitOnBuildException = true
	
	reports = {
	  HtmlReport('html') {    // Report type is 'html'
		outputFile = 'target/CodeNarcReport.html' //Output file name
		title = 'SingleTenantBase Code Narc Report' // Title of the file
	  }
	}
}
*/
