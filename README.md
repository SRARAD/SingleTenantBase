SingleTenantBase
=========
A base Grails 2.3.9 project for bootstrapping new projects.

## Additions to base project

### Plugins
- **CodeNarc** - Generates static code analysis for Groovy code that can be viewed as html report or within jenkins violation   plugin
- **Export** - Adds export functionality to domain objects in many different formats e.g. CSV, Excel, Open Document Spreadsheet, PDF and XML
- **Searchable** - Makes domain objects searchable and can be extended to add additional formats
- **Executor** - Allows processes to be run in the background
- **Markdown** - Markdown renderer
- **Spring Security** - Adds basic authentication to the project
- **Spring Security UI** - Adds additional CRUD interfaces to Spring Security

### Dependencies
- **AWS Java SDK** - AWS SDK for Java
- **MySQL Java Connector** - JDBC connector for MySQL

### Domain Objects
- **Spring Security** - Admin and user accounts and roles

### Controllers
- **Home** - Basic home controller and functions

### Views
- **Index** - Modified index page with basic home controller function links

### Bootstrap
- **Users** - Creates a basic and admin user

### JavaScript
- **jQuery** - jQuery 2.1.0
- **BlockUI** - Modal block for AJAX calls
- **Chosen** - Select input enhancer
- **jqPagination** - Pagination plugin
- **Reveal** - Modal popups

### Logging

Log4j has been setup for the project to listen to all **com.sra** logging output.

- **ERROR** and above gets output to the console
- **INFO** and above gets logged to **logs/info.log**
- **WARN** and above gets logged to **logs/warn.log**
- All page requests are recorded in **logs/activity.log** with the date, username, controller, and action

### Other
- **Semantic UI** - Styling framework
- **MySQL DB Config** - Commented out DataSource config for MySQL connections

## TODO
Things to do when first branching the base repository.

- Refactor home controller and services to new package name.
- Change base users' passwords.
- Search all files for SingleTenantBase and change to new app name.
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

### Searchable

The **Searchable** plugin is a powerful way to perform free text search on domain objects. Below are instructions to configure STB for search:

- Add `static searchable  = { mapping { spellCheck "include" } }` to searchable domain objects.
- Overwrite the default `toString()` method on searchable domain objects, this will be the title of the element when returned by a search query
	- **Make sure that any fields and objects used in the `toString()` method are also searchable otherwise they will not be included in the Searchable index**
- Add a `Collection<String> highlight()` method to the searchable domain objects which returnes a collection of all fields you want highlighted if they contain the search term (e.g. name, description)

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

## License

**SingleTenantBase** has been released under the MIT license by [SRA International, INC](https://www.sra.com/). It was originally developed specifically for the [SRA Rapid Application Development Team](https://github.com/SRARAD).