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