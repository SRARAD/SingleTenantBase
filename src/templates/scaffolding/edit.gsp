<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="semantic">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>			
			<div class="ui segment">
				<h1 class="ui header">
					<g:message code="default.edit.label" args="[entityName]" />
				</h1>
					<g:link class="ui primary button" action="index"><i class="browser icon"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
					<g:link class="positive ui button" tabindex="0" action="create"><i class="write icon"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
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
				<g:form class="ui form" url="[resource:${propertyName}, action:'update']" method="PUT" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<g:hiddenField name="version" value="\${${propertyName}?.version}" />
						<g:render template="form"/>
						<g:actionSubmit class="ui button" action="update" value="\${message(code: 'default.button.update.label', default: 'Update')}" />
				</g:form>
			</div>
	</body>
</html>
