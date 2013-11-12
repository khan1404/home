<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: v_home --->
<!--- fuseaction: homepage --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "v_home">
<cfset myFusebox.thisFuseaction = "homepage">
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_home/prefuseaction.cfm")><cfoutput><cfinclude template="../view/v_home/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_home/homepage.cfm")><cfoutput><cfinclude template="../view/v_home/homepage.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of homepage which is not defined in Circuit v_home."></cfif>
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_home/postfuseaction.cfm")><cfoutput><cfinclude template="../view/v_home/postfuseaction.cfm" /></cfoutput></cfif>

