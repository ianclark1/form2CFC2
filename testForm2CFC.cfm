<!---
(c) 2006 by terbach
http://www.terbach.com

author			: Timo Erbach
creation date	: 21.10.2006
last changed	: 21.10.2006
fileName		: testForm2CFC.cfm
version			: 1.0
description		: Test the CFC an demonstrates how to use it with multiple objects.
--->

<cfif isDefined("form.doTest")>
	<cfset myPerson = createObject("component", "cPerson")>
	<cfset myPerson2 = createObject("component", "cPerson2")>
	<cfset fillForm = createObject("component", "form2CFC")>
	<cfset fillForm.init(myPerson)>
	<cfset success = fillForm.fillFromForm()>
	<cfset fillForm.reAssign(myPerson2)>
	<cfset success = fillForm.fillFromForm()>

	<!--- debugOutput --->
		<cfoutput>
			Hello #myPerson.getLastname()#&nbsp;#myPerson.getFirstname()#!<br>
			I come from #myPerson2.getCountry()#.
		</cfoutput>
	<!--- /debugOutput --->
</cfif>

<cfoutput>
	<form action="#cgi.scriptname#" method="post">
		<table>
			<tr>
				<td>Lastname</td>
				<td><input type="text" name="lastname"></td>
			</tr>
			<tr>
				<td>Firstname</td>
				<td><input type="text" name="firstname"></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" name="country"></td>
			</tr>
			<tr>
				<td><input type="submit" name="doTest" value="TEST"></td>
			</tr>
		</table>
	</form>
</cfoutput>