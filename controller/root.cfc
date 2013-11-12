component root{
	
	public function prefuseaction( required component myFusebox , required component event ){
		
	}
	
	public function home( required component myFusebox , required component event ){
		
		myFusebox.do( action="v_components.main_nav" , contentvariable="navbar" );
		myFusebox.do( action="v_home.homepage" , contentvariable="content" );
		myFusebox.do( action="v_components.main_footer" , contentvariable="footer" );
	}
	
	public function postfuseaction( required component myFusebox , required component event ){
		myFusebox.do( action="v_layout.layout");
	}
	
}