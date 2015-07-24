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
			<g:link class="ui primary labeled icon button" action="index"><i class="list icon"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="positive ui labeled icon button" tabindex="0" action="create"><i class="write icon"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
			<g:if test="\${flash.message}">
				<div class="ui message" role="status">
					\${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
				<div class="ui negative icon message">
					<i class="remove circle outline icon"></i>
					<div class="content">
						<g:eachError bean="\${${propertyName}}" var="error">
							<p>
								<g:message error="\${error}"/>
							</p>
						</g:eachError>
					</div>
				</div>
			</g:hasErrors>
			<div class="ui segment">
				<g:form class="ui form" url="[resource:${propertyName}, action:'update']" method="PUT" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<g:hiddenField name="version" value="\${${propertyName}?.version}" />
					<g:render template="form"/>
					<g:actionSubmit class="ui button" action="update" value="\${message(code: 'default.button.update.label', default: 'Update')}" />
				</g:form>
			</div>
		</div>
	</body>
</html>
