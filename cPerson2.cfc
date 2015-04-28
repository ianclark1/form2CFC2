<!---
(c) 2006 by terbach
http://www.terbach.com

author			: Timo Erbach
creation date	: 21.10.2006
last changed	: 21.10.2006
fileName		: cPerson2.cfc
version			: 1.0
description		: This CFC represents an other personObject with methods.
--->

<cfcomponent name="cPerson">

	<!--- constructor --->
	<cfset variables.country = "country">

	<!--- methods --->
	<cffunction name="setCountry" returntype="void" access="public" output="false">
		<cfargument name="data" type="string" required="true">

		<cfset variables.country = trim(arguments.data)>
	</cffunction>

	<cffunction name="getCountry" returntype="string" access="public" output="false">
		<cfreturn trim(variables.country)>
	</cffunction>
</cfcomponent>