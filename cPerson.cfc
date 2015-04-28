<!---
(c) 2006 by terbach
http://www.terbach.com

author			: Timo Erbach
creation date	: 21.10.2006
last changed	: 21.10.2006
fileName		: cPerson.cfc
version			: 1.0
description		: This CFC represents a personObject with methods.
--->

<cfcomponent name="cPerson">

	<!--- constructor --->
	<cfset variables.lastname = "lastname">
	<cfset variables.firstname = "firstname">

	<!--- methods --->
	<cffunction name="setLastname" returntype="void" access="public" output="false">
		<cfargument name="data" type="string" required="true">

		<cfset variables.lastname = trim(arguments.data)>
	</cffunction>

	<cffunction name="setFirstname" returntype="void" access="public" output="false">
		<cfargument name="data" type="string" required="true">

		<cfset variables.firstname = trim(arguments.data)>
	</cffunction>

	<cffunction name="getLastname" returntype="string" access="public" output="false">
		<cfreturn trim(variables.lastname)>
	</cffunction>

	<cffunction name="getFirstname" returntype="string" access="public" output="false">
		<cfreturn trim(variables.firstname)>
	</cffunction>
</cfcomponent>