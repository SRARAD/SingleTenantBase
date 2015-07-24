<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="semantic">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
			<div class="ui segment">
				<h1 class="ui header">
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
				<g:link class="ui primary labeled icon button" action="index"><i class="list icon"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="positive ui labeled icon button" action="create"><i class="write icon"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
				<div class="ui segment">	
					<g:if test="\${flash.message}">
						<div class="ui positive icon message">
							<i class="checkmark icon"></i>
							<div class="content">
								<div class="header" role="status">Success</div>
								<p>\${flash.message}</p>
							</div>
						</div>
					</g:if>
					<table class="ui very basic table">
						<tbody>
							<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
								allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
								props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
								Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
								props.each { p -> %>
									<tr>
										<g:if test="\${${propertyName}?.${p.name}}">
											<td class="right aligned collapsing">
												<b><label id="${p.name}-label" class="property-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label></b>
											</td>
											<td>
												<%  if (p.isEnum()) { %>
													<span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
												<%  } else if (p.oneToMany || p.manyToMany) { %>
													<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
														<span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></span><br />
													</g:each>
												<%  } else if (p.manyToOne || p.oneToOne) { %>
													<span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></span>
												<%  } else if (p.type == Boolean || p.type == boolean) { %>
													<span class="property-value" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></span>
												<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
													<span class="property-value" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></span>
												<%  } else if (!p.type.isArray()) { %>
													<span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
												<%  } %>
											</td>
										</g:if>
									</tr>
							<%  } %>
						</tbody>
					</table>
					<g:form class="ui form" url="[resource:${propertyName}, action:'delete']" method="DELETE">
						<g:link class="ui labeled icon button" action="edit" resource="\${${propertyName}}"><i class="edit icon"></i><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="negative ui button" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />					
					</g:form>
				</div>
			</div>
	</body>
</html>
