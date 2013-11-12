<cfcomponent extends="fusebox5.Application" output="false">
	
	<cfset this.name = "Intranet V1.1" />
	<cfset this.sessionmanagement = true />
	
	<cfscript>
		FUSEBOX_PARAMETERS.allowImplicitFusebox = true;
		FUSEBOX_PARAMETERS.defaultFuseaction = "root.home";
		FUSEBOX_PARAMETERS.password = "Woodside1056##";
		FUSEBOX_PARAMETERS.mode = "development-full-load";
		// use the core file error templates:
		FUSEBOX_PARAMETERS.errortemplatesPath = "/fusebox5/errortemplates/";
		// demonstrate SES URLs (assuming your web server / application server supports pass-through of path information):
		FUSEBOX_PARAMETERS.queryStringStart = "/";
		FUSEBOX_PARAMETERS.queryStringSeparator = "$";
		FUSEBOX_PARAMETERS.queryStringEqual = ":";

		// should use FUSEBOX_PARAMETERS or some other mechanism:
		application.dsn = "intranet";
		
	</cfscript>
	
	<cffunction name="onRequestStart">
		<cfargument name="targetPage" />
		
		<cfset super.onRequestStart(arguments.targetPage) />
		
		<!--- this is analogous to the root fbx_Settings.cfm file in FB3 --->
		<cfset self = myFusebox.getSelf() />
		<cfset myself = myFusebox.getMyself() />
		
	</cffunction>
	
	<cffunction name="onFuseboxApplicationStart">
	
		<!--- this is a no-op but it's safe to call it --->
		<cfset super.onFuseboxApplicationStart() />
	
		
	</cffunction>
	
</cfcomponent>