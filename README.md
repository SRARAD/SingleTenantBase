SingleTenantBase
=========
A base Grails 2.3.9 project for bootstrapping new projects.

## Additions to base project

### Plugins
- **CodeNarc** - Generates static code analysis for Groovy code that can be viewed as html report or within jenkins violation   plugin
- **Export** - Adds export functionality to domain objects in many different formats e.g. CSV, Excel, Open Document Spreadsheet, PDF and XML
- **Searchable** - Makes domain objects searchableand can be extended to add additional formats
- **Executor** - Allows processes to be run in the background
- **Spring Security** - Adds basic authentication to the project
- **Spring Security UI** - Adds additional CRUD interfaces to Spring Security
- **Spring Security OAuth2** - Adds oauth

#### SRA Plugins

- **SRA SAML** - Okta authentication for sattelite applications
- **DB Backup** - Automatic H2 backups to S3


### Dependencies
- **AWS Java SDK** - AWS SDK for Java
- **MySQL Java Connector** - JDBC connector for MySQL

### Domain Objects
- **Spring Security** - Admin and user accounts and roles

### Controllers
- **Home** - Basic home controller and functions

### Views
- **Index** - Modified index page with basic home controller function links
- **RAD** - About the RAD team page
- **Menu** - Layout containing a side menu, change the layout from **main** to **menu** to use it

### Bootstrap
- **Users** - Creates a basic and admin user

### JavaScript
- **jQuery** - jQuery 2.1.0
- **BlockUI** - Modal block for AJAX calls
- **Chosen** - Select input enhancer
- **jqPagination** - Pagination plugin
- **Reveal** - Modal popups

### Other
- **MySQL DB Config** - Commented out DataSource config for MySQL connections
- **Activity Logging** - All actions are recorded in **Activity.log** in the root directory with the date, username, controller, and action
- **Version Bump** - Shell script which bumps the app version, merges the dev branch into master, and tags the release

## TODO
Things to do when first branching the base repository.

- Refactor home controller and services to new package name.
- Change base users' passwords.
- Search all files for SingleTenantBase and change to new app name.
- Search all files for stb.srarad.com and change to the new app URL.
- Add `static searchable  = { mapping { spellCheck "include" } }` to searchable domain objects.
- Edit the configs under **SRA Plugins** in **Config.groovy**
- Add any number of codeNarc properties into grails-app/conf/BuildConfig.groovy. For example, you can configure one or more reprots using codenarc.reports property as follows

```
codenarc.reports = {
    // generate xml report
	MyXmlReport('xml') {                    
		outputFile = 'target/CodeNarcReport.xml'  // Set the 'outputFile' property of the (XML) Report
		title = 'SingleTenantBase XML Report'             // Set the 'title' property of the (XML) Report
	}
	// generate html report
		MyHtmlReport('html') {                  
		outputFile = 'target/CodeNarcReport.html'
		title = 'SingleTenantBase html Report'
	}
} 
```
- **SSL**
  - Change the final DNS name in lines 23-24 of **web-app/.ebextensions/ssl.config** from the default.
  - Change the server name in line 39.
  - Change production database url value in DataSource.groovy from prodDb to something else

## SSO
To enable SSO follow the instructions in the **SRA SAML Plugin** readme.


## Disconnecting and Pushing a New Project to GitHub
This section describes the steps to disconnect a modified SingleTenantBase project from source control and pushing it as a new project to GitHub.

- Pull down SingleTenantBase from GitHub.
- Modify it according to the **TODO** section above.
- Create a new repository on GitHub with the new project name
- Right click on the project in 'Project Explorer' -> Team -> Show in Repository View
- Right click on the project in 'Git Repository' -> Delete Repository -> Only select 'Delete Git Data and History'
- Right click on the project in 'Project Explorer' -> Team -> Disconnect
- Right click on the project in 'Project Explorer' -> Delete -> Leave 'Delete project contents...' **unchecked** -> OK
- Find the project in your file system -> Rename the folder to the new project name
- File -> Import -> Grails -> Grails Project -> Find the newly renamed folder -> Finish
- Right click on the project in 'Project Explorer' -> Team -> Share Project -> Git -> Make sure the checkbox at the top is checked -> Click on the project -> Create Repository -> Finish
- Right click on the project in 'Project Explorer' -> Team -> Commit -> Write a commit message and select all files -> Commit
- Right click on the project in 'Git Repository' -> Push Branch -> Enter the new repository information -> Next -> Next -> Finish
