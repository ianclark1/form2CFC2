<!---
(c) 2006 by terbach
http://www.terbach.com

author			: Timo Erbach
creation date	: 11.10.2006
last changed	: 21.10.2006
fileName		: form2CFC.cfc
version			: 1.1
description		: This CFC helps you to quickly fill a CFC with the values of formFields.
--->

<cfcomponent name="form2CFC" output="false" hint="This CFC helps you to quickly fill a CFC with the values of formFields.">
	<!--- constructor --->
	<cfset variables.associatedCFC = "">

	<cffunction name="init" returntype="void" access="public" output="false" hint="Initializing the instance of the component.">
		<cfargument name="cfc" type="any" required="true" hint="The CFC where the formData shall be filled in.">

		<cfset reAssign(arguments.cfc)>
	</cffunction>

	<cffunction name="reAssign" returntype="void" access="public" output="false" hint="Assign a new CFC to fill from form with this component.">
		<cfargument name="cfc" type="any" required="true" hint="The CFC where the formData shall be filled in.">

		<cfset variables.associatedCFC = arguments.cfc>
	</cffunction>


	<cffunction name="fillFromForm" returntype="boolean" access="public" output="false" hint="Copies the formFields with corresponding setters into the associated (see init()) CFC.">

		<!--- local settings --->
		<cfset var error = false>
		<cfset var currentSetter = "">
		<cfset var parameter = structNew()>
		<cfset parameter.name = "">
		<cfset parameter.type = "">
		<cfset parameter.value = "">

		<!--- loop over formFields an call setter from associated CFC --->
		<cfloop list="#form.fieldnames#" index="currentField">
			<cftry>
				<cfset currentSetter = "set" & trim(currentField)>
				<cfset variables.CFCMetaData = getMetaData(#variables.associatedCFC#)>

				<cfloop from="1" to="#arrayLen(variables.CFCMetaData.functions)#" index="i">
					<cfif variables.CFCMetaData.functions[i].name eq currentSetter>
						<cfset parameter.name = variables.CFCMetaData.functions[i].parameters[1].name>
						<cfset parameter.type = variables.CFCMetaData.functions[i].parameters[1].type>

						<cfif parameter.type eq "string">
							<cfset parameter.value = trim(evaluate('form.' & currentField))>
						<cfelseif parameter.type eq "numeric">
							<cfset parameter.value = val(evaluate('form.' & currentField))>
						<cfelse>
							<cfset parameter.value = trim(evaluate('form.' & currentField))>
						</cfif>

						<cfinvoke component="#variables.associatedCFC#" method="#currentSetter#">
							<cfinvokeargument name="#parameter.name#" value="#parameter.value#">
						</cfinvoke>
						<cfbreak>
					</cfif>
				</cfloop>

				<cfcatch type="any">
					<cfset error = true>
				</cfcatch>
			</cftry>
		</cfloop>

		<cfreturn not error>
	</cffunction>
</cfcomponent>