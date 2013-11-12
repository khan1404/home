<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: v_layout --->
<!--- fuseaction: layout --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "v_layout">
<cfset myFusebox.thisFuseaction = "layout">
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_layout/prefuseaction.cfm")><cfoutput><cfinclude template="../view/v_layout/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_layout/layout.cfm")><cfoutput><cfinclude template="../view/v_layout/layout.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of layout which is not defined in Circuit v_layout."></cfif>
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_layout/postfuseaction.cfm")><cfoutput><cfinclude template="../view/v_layout/postfuseaction.cfm" /></cfoutput></cfif>

