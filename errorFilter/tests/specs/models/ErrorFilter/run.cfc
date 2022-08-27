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
					errors  = getInstance( "CreateErrors@errorFilter" );
					err     = errors.expressionError();
					testobj = createmock( object = getInstance( "ErrorFilter@ErrorFilter" ) );
				} );
				it( "Should call obtainProcessClass 1x", function(){
					testobj.$( method = "obtainProcessClass", returns = "database" );
					testme = testObj.run( err );
					expect( testObj.$count( "obtainProcessClass" ) ).tobe( 1 );
				} );
			}
		);
	}

}
