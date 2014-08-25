SingleTenantBase
=========
A base Grails 2.3.9 project for bootstrapping new projects.

## Additions to base project
### Plugins

- **Export** - adds export functionality to domain objects in many different formats e.g. CSV, Excel, Open Document Spreadsheet, PDF and XML.
- **Searchable** - Makes domain objects searchableand can be extended to add additional formats.
- **Executor** - Allows processes to be run in the background
- **Crypto** - Uses a private key to communicate authentication parameters from the RADApps server
- **Spring Security** - Adds basic authentication to the project
- **Spring Security UI** - Adds additional CRUD interfaces to Spring Security
- **Spring Security OAuth2** - Adds oauth


### Dependencies
- **AWS Java SDK** - AWS SDK for Java
- **MySQL Java Connector** - JDBC connector for MySQL

### Domain Objects
- **Spring Security** - Admin and user accounts and roles

### Controllers
- **Home** - Basic home controller and functions
- **SAML** - SAML controller for OKTA access

### Views
- **Index** - Modified index page with basic home controller function links
- **RAD** - About the RAD team page
- **Menu** - Layout containing a side menu, change the layout from **main** to **menu** to use it

### Bootstrap
- **Users** - Creates a basic and admin user
- **DBBackup** - Kicks off DB backups

### Services
- **DBBackup** - S3 backup service

### JavaScript
- **jQuery** - jQuery 2.1.0
- **BlockUI** - Modal block for AJAX calls
- **Chosen** - Select input enhancer
- **jqPagination** - Pagination plugin
- **Reveal** - Modal popups

### Other
- **MySQL DB Config** - Commented out DataSource config for MySQL connections
- **Activity Logging** - All actions are recorded in **Activity.log** in the root directory with the date, username, controller, and action

## TODO
Things to do when first branching the base repository.

- Change stem DBBackup service variable to a lowercase concise name so backup buckets don't overlap.
- Refactor home controller and services to new package name.
- Change base users' passwords.
- Search all files for SingleTenantBase and change to new app name.
- Add static searchable  = { mapping { spellCheck "include" } } to searchable domain objects.
- **SSL**
  - Change the final DNS name in lines 23-24 of **web-app/.ebextensions/ssl.config** from the default.

## SSO
To enable SSO:

- Change `appName` in line 15 of **SamlController** to some unique application name
	- **NOTE:** If you need to test SSO locally use **localhost** as the app name and test using **127.0.0.1:8080**, otherwise access **localhost:8080/login/auth** to login locally
- Add an entry to **sso.sravvc.com/application** with the name created above and the final url of the form **myapp.srarad.com/saml/login**
- If you want a session timeout
	- Uncomment the filter in lines 12-15 of **conf/com/sra/SessionTimeoutFilters.groovy**
	- The default timeout is 1 hour, this can be changed by changing the **3600** in the if statement to the desired number of seconds


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
