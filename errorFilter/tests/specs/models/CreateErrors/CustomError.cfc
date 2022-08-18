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
			title  = "CustomError should",
			labels = "automated",
			body   = function(){
				beforeEach( function(){
					testobj = createmock( object = getInstance( "CreateErrors@ErrorFilter" ) );
				} );
				it( "return a `myCustom` error", function(){
					testme = testobj.customError();
					expect( testme.type ).tobe( "mycustom" );
				} );
			}
		);
	}

}
