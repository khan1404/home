<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: root --->
<!--- fuseaction: home --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "root">
<cfset myFusebox.thisFuseaction = "home">
<cfparam name="__fuseboxCircuitCfc_intranet_controller_root" default="#createObject('component','intranet.controller.root')#" />
<cfif structKeyExists(__fuseboxCircuitCfc_intranet_controller_root,"prefuseaction") and isCustomFunction(__fuseboxCircuitCfc_intranet_controller_root.prefuseaction)>
<cfset __fuseboxCircuitCfc_intranet_controller_root.prefuseaction(myFusebox=myFusebox,event=event) />
</cfif>
<cfif structKeyExists(__fuseboxCircuitCfc_intranet_controller_root,"home") and isCustomFunction(__fuseboxCircuitCfc_intranet_controller_root.home)>
<cfset __fuseboxCircuitCfc_intranet_controller_root.home(myFusebox=myFusebox,event=event) />
<cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of home which is not defined in Circuit root.">
</cfif>
<cfif structKeyExists(__fuseboxCircuitCfc_intranet_controller_root,"postfuseaction") and isCustomFunction(__fuseboxCircuitCfc_intranet_controller_root.postfuseaction)>
<cfset __fuseboxCircuitCfc_intranet_controller_root.postfuseaction(myFusebox=myFusebox,event=event) />
</cfif>
<cfcatch><cfrethrow></cfcatch>
</cftry>

