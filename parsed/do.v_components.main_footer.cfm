<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: v_components --->
<!--- fuseaction: main_footer --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "v_components">
<cfset myFusebox.thisFuseaction = "main_footer">
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_components/prefuseaction.cfm")><cfoutput><cfinclude template="../view/v_components/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_components/main_footer.cfm")><cfoutput><cfinclude template="../view/v_components/main_footer.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of main_footer which is not defined in Circuit v_components."></cfif>
<cfif fileExists("C:/inetpub/wwwroot/intranet/parsed/../view/v_components/postfuseaction.cfm")><cfoutput><cfinclude template="../view/v_components/postfuseaction.cfm" /></cfoutput></cfif>

