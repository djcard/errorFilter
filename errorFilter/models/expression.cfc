component extends="errorFilter.models.BaseFilter" accessors="true" {

	struct function run( required struct err ){
		return super.run( err, "expression" );
	}

}
