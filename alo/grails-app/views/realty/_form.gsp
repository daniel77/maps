<%@ page import="alo.Realty" %>



<div class="fieldcontain ${hasErrors(bean: realtyInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="realty.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${realtyInstance?.address}" />

</div>

<div class="fieldcontain ${hasErrors(bean: realtyInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="realty.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${realtyInstance?.name}" />

</div>

<div class="fieldcontain ${hasErrors(bean: realtyInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="realty.photos.label" default="Photos" />
		
	</label>
	<g:textField name="photos" value="${realtyInstance?.photos}" />

</div>

