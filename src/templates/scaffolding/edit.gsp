<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="semantic">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>			
		<div id="edit-${domainClass.propertyName}" class="content scaffold-edit" role="main">
			<div class="ui segment">
				<h1 class="ui header">
					<g:message code="default.edit.label" args="[entityName]" />
				</h1>
				<button class="ui button">
					<g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				</button>
				<button class="ui button" tabindex="0">
					<g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</button>
				<g:if test="\${flash.message}">
				<div class="message" role="status">\${flash.message}</div>
				</g:if>
				<g:hasErrors bean="\${${propertyName}}">
				<ul class="errors" role="alert">
					<g:eachError bean="\${${propertyName}}" var="error">
					<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form url="[resource:${propertyName}, action:'update']" method="PUT" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<g:hiddenField name="version" value="\${${propertyName}?.version}" />
					<form class="ui form">
						<g:render template="form"/>
						<button class="ui button"><g:actionSubmit class="save" action="update" value="\${message(code: 'default.button.update.label', default: 'Update')}" /></button>
					</form>
				</g:form>
			</div>
		</div>
	</body>
</html>
