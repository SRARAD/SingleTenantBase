<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="semantic">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
			<div class="ui segment">
				<h1 class="ui header">
					<g:message code="default.create.label" args="[entityName]" />
				</h1>
					<g:link class="ui primary labeled icon button" action="index"><i class="browser icon"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
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
				<div class="ui segment">
					<g:form class="ui form" url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
							<g:render template="form"/>
							<g:submitButton name="create" class="positive ui button" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
					</g:form>
				</div>
			</div>
	</body>
</html>
