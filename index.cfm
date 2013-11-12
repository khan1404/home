<cfsilent>
<cfapplication 
	name="ggcc55" 
	sessionmanagement="Yes" 					
	sessiontimeout="#CreateTimeSpan(0,0,30,0)#" 	
	clientmanagement="No">
</cfsilent>
<cfset FUSEBOX_APPLICATION_PATH = ""> 
<cfinclude template="/fusebox4/fusebox4.runtime.cfmx.cfm" />