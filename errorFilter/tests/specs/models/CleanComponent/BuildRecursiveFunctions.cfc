/**
 * My BDD Test
 */
component extends="coldbox.system.testing.BaseTestCase" accessors="true" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		super.beforeAll();
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/


	function run(){
		describe(
			title  = "Run should",
			labels = "automated",
			body   = function(){
				beforeEach( function(){
					fakeStruct = {
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ]
					};

					compStruct = {
						"functions" : [
							{name:"yoyo"}
						],
						"extends" : {
							functions:[
								{name:"oh yeah"}
							],
							extends:{
								functions : [
								{name:"thirdlevel"},
								{name:"thirdlevelA"},
								{name:"thirdlevelA"},
									]
							}
						}
					};

					testobj = createmock( object = getInstance( "cleanComponent@ErrorFilter" ) );

				} );
				it( "should return an array", function(){
					testme = testObj.buildRecursiveFunctions( compStruct );
					expect( testme ).tobeTypeOf( "array" );
				} );
				it( "should return an array of the cumulated functions of all extended components", function(){
					testme = testObj.buildRecursiveFunctions( compStruct );
					expect( testme.len() ).tobe( compStruct.functions.len() + compStruct.extends.functions.len() + compStruct.extends.extends.functions.len() );
				} );
			}
		);
	}

}
