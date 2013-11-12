<cfscript>
	
	function prefuseaction(myFusebox,event) {

		event.xfa("Contact","ggcc.contact");
		withLayout = true;
		appData = myFusebox.getApplicationData();

	}
	
	function postfuseaction(myFusebox,event) {

		if (withLayout) {
			myFusebox.do("view.layGGCC");
		}

	}
	
	function home(myFusebox,event) {
		
		event.xfa("ShowTasks","ggcc.showmanager");
		event.xfa("Constitution","ggcc.showpage","pageName","constitution");
		event.xfa("Bylaws","ggcc.showpage","pageName","bylaws");
		event.xfa("Minutes","ggcc.showpage");

		myFusebox.do("view.dspShowHome","content");
	}
	
	function showpage(myFusebox,event) {

		withLayout = false;
		myFusebox.do("view.dspStaticPage");

	}
	
	function contact(myFusebox,event) {
	
		var users = appData.usermanager.getMembers();

		event.setValue("userById",appData.usermanager.getMembersByID(users));
		
		event.xfa("SendMail","ggcc.sendmail");
		event.xfa("Home","ggcc.home");
		
		myFusebox.do("view.dspShowContact","content");
	}
	
	function sendmail(myFusebox,event) {
	
		appData.mailer.sendMail(argumentCollection=event.getAllValues());
		
		event.xfa("next","ggcc.home","message","Thank you for your email!");
		myFusebox.relocate(xfa="next");
	}
	
	function identify(myFusebox,event) {
	
		event.setValue("users",appData.usermanager.getMembers());
		
		event.xfa("SelectIdentity","ggcc.setidentity");
		
		myFusebox.do("view.dspShowIdentity","content");
	}
	
	function setIdentity(myFusebox,event) {
	
		appData.usermanager.setIdentity(event.getValue("userId"));
		
		event.xfa("next","ggcc.showmanager");
		myFusebox.relocate(xfa="next");
	}
	
	function checkIdentity(myFusebox,event) {
	
		appData.usermanager.checkIdentity();
		
		if (not structKeyExists(session,"userId")) {
			event.xfa("next","ggcc.identify");
			myFusebox.relocate(xfa="next");
		}
	}
	
	function showManager(myFusebox,event) {

		checkIdentity(myFusebox,event);
		
		event.setValue("userById",appData.usermanager.getMembersById( appData.usermanager.getMembers() ));
		event.setValue("tasks",appData.taskmanager.getTaskList());
		event.setValue("statusLookup",appData.taskmanager.getStatiiById( appData.taskmanager.getStatii() ));

		event.xfa("AddTask","ggcc.newtask");
		event.xfa("ChangeIdentity","ggcc.identify");
		event.xfa("TaskDetail","ggcc.showtask");
		
		myFusebox.do("view.dspShowTaskList","content");	
	}
	
	function showtask(myFusebox,event) {
	
		checkIdentity(myFusebox,event);
		
		event.setValue("users",appData.usermanager.getMembers());
		event.setValue("userById",appData.usermanager.getMembersById(event.getValue("users")));
		event.setValue("statii",appData.taskmanager.getStatii());
		event.setValue("taskInfo",appData.taskmanager.getTask(event.getValue("taskId")));
		
		event.xfa("Manager","ggcc.showmanager");
		event.xfa("SaveTask","ggcc.savetask");
		
		myFusebox.do("view.dspShowTask","content");
	}
	
	function newTask(myFusebox,event) {
	
		checkIdentity(myFusebox,event);
		
		event.setValue("users",appData.usermanager.getMembers());
		event.setValue("statii",appData.taskmanager.getStatii());
		
		event.xfa("Manager","ggcc.showmanager");
		event.xfa("SaveNewTask","ggcc.addtask");
		
		myFusebox.do("view.dspNewTask","content");
	}
	
	function saveTask(myFusebox,event) {
		
		checkIdentity(myFusebox,event);
		
		appData.taskmanager.saveTask(event.getValue("taskId"),event.getValue("ownerId"),event.getValue("statusId"));
		
		addNoteAndNotify(myFusebox,event);
	}
	
	function addTask(myFusebox,event) {
	
		checkIdentity(myFusebox,event);
		
		event.setValue("taskId",appData.taskmanager.addTask(event.getValue("taskName"),event.getValue("ownerId"),event.getValue("statusId")));
		
		addNoteAndNotify(myFusebox,event);
	}
	
	function addNoteAndNotify(myFusebox,event) {
		
		appData.taskmanager.addNote(event.getValue("taskId"),event.getValue("noteText"));

		event.setValue("userById",appData.usermanager.getMembersById( appData.usermanager.getMembers() ));
		event.setValue("statusLookup",appData.taskmanager.getStatiiById( appData.taskmanager.getStatii() ));

		appData.taskmanager.notifyMembers(argumentCollection=event.getAllValues());
		
		event.xfa("next","ggcc.showmanager");
		myFusebox.relocate(xfa="next");
	}
	
</cfscript>
