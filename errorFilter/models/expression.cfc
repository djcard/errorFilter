component extends="errorFilter.models.BaseFilter" accessors="true" {

	struct function run( required any err ){
		return super.run( err, "expression" );
	}

}
