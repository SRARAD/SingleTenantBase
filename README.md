SingleTenantBase
=========
A base Grails 2.3.9 project for bootstrapping new projects.

## Additions to base project ##
### Plugins ###

- **Searchable** - Makes domain objects searchable
- **Executor** - Allows processes to be run in the background
- **Spring Security** - Adds basic authentication to the project
- **Spring Security UI** - Adds additional CRUD interfaces to Spring Security
- **Spring Security OAuth2** - Adds oauth

### Dependencies ###
- **AWS Java SDK** - AWS SDK for Java
- **MySQL Java Connector** - JDBC connector for MySQL

### Domain Objects ###
- **Spring Security** - Admin and user accounts and roles

### Controllers ###
- **Home** - Basic home controller and functions

### Views ###
- **Index** - Modified index page with basic home controller function links
- **RAD** - About the RAD team page
- **Menu** - Layout containing a side menu, change the layout from **main** to **menu** to use it

### Bootstrap ###
- **Users** - Creates a basic and admin user
- **DBBackup** - Kicks off DB backups

### Services ###
- **DBBackup** - S3 backup service

### JavaScript ###
- **jQuery** - jQuery 2.1.0
- **BlockUI** - Modal block for AJAX calls
- **Chosen** - Select input enhancer
- **jqPagination** - Pagination plugin

### Other ###
- **MySQL DB Config** - Commented out DataSource config for MySQL connections

## TODO ##
Things to do when first branching the base repository.

- Change stem DBBackup service variable to a lowercase concise name so backup buckets don't overlap.
- Refactor home controller and services to new package name.
- Change base users' passwords.
- Search all files for SingleTenantBase and change to new app name.
- Add static searchable  = { mapping { spellCheck "include" } } to searchable domain objects.

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
