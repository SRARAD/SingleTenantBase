<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="semantic">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-${domainClass.propertyName}" class="content scaffold-create" role="main">
			<div class="ui segment">
				<h1 class="ui header">
					<g:message code="default.create.label" args="[entityName]" />
				</h1>
				<button class="ui button">
					<g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
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
				<g:form url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<form class="ui form">
						<div class="ui field" >
						<g:render template="form"/>
						</div>
						<g:submitButton name="create" class="ui button" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
					</form>
				</g:form>
			</div>
		</div>
	</body>
</html>
