component extends="errorFilter.models.BaseFilter" accessors="true" {

	struct function run( err ){
		return super.run( err, "general" );
	}

}
