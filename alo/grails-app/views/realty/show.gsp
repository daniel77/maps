
<%@ page import="alo.Realty" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'realty.label', default: 'Realty')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-realty" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-realty" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list realty">
			
				<g:if test="${realtyInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="realty.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${realtyInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${realtyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="realty.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${realtyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${realtyInstance?.photos}">
				<li class="fieldcontain">
					<span id="photos-label" class="property-label"><g:message code="realty.photos.label" default="Photos" /></span>
					
						<span class="property-value" aria-labelledby="photos-label"><g:fieldValue bean="${realtyInstance}" field="photos"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:realtyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${realtyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
