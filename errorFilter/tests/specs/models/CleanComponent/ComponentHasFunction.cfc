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
					testobj       = createmock( object = getInstance( "cleanComponent@ErrorFilter" ) );
					fakeComponent = createMock( object = createStub() );
				} );
				it( "If the component does not have  the getmementoFunction, return false", function(){
					testme = testObj.componentHasFunction( getMetadata( fakeComponent ).functions );
					expect( testme ).tobeFalse();
				} );
				it( "If the component has the getMementoFunction, return true", function(){
					var fc = createObject( "fakeComponent" );
					testme = testObj.componentHasFunction( getMetadata( fc ).functions );
					expect( testme ).tobeTrue();
				} );
			}
		);
	}

}
