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
		//super.afterAll();
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


					testobj = createmock( object = getInstance( "cleanComponent@ErrorFilter" ) );

					fakeComponent = createStub();
					testObj.$( method = "normalizeNode", returns = {} );
				} );
				it( "Should call normalizeNode 1x per key submitted struct", function(){
					testme = testObj.normalizeStruct( fakeStruct );
					expect( testObj.$count( "normalizeNode" ) ).tobe( fakeStruct.keyArray().len() );
				} );
			}
		);
	}

}
