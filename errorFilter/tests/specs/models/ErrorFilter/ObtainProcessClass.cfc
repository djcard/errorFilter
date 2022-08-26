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
			title  = "ObtainProcessClass should",
			labels = "automated",
			body   = function(){
				beforeEach( function(){
					fakeKey        = mockdata( $type = "words:1" )[ 1 ];
					fakeClass      = mockdata( $type = "words:1" )[ 1 ];
					fakeAny        = mockdata( $type = "words:1" )[ 1 ];
					fakeCompReturn = mockdata( $type = "words:1" )[ 1 ];
					errorClasses   = {
						"#fakeKey#" : fakeClass,
						"any"       : fakeAny,
						"component" : fakeCompReturn
					};
					testobj = createmock( object = getInstance( "ErrorFilter@ErrorFilter" ) );
					testObj.seterrorClasses( errorClasses );
				} );
				it( "If there is no type in the submitted error, return the 'any' value", function(){
					testme = testObj.obtainProcessClass( {} );
					expect( testme ).toBe( fakeAny );
				} );
				it( "If the submitted type is not in the errorClasses object, return the 'Any' value", function(){
					testme = testObj.obtainProcessClass( { type : fakeClass } );
					expect( testme ).toBe( fakeAny );
				} );
				it( "If the submitted type is in the errorClasses object, return the corresponding value", function(){
					testme = testObj.obtainProcessClass( { type : fakeKey } );
					expect( testme ).toBe( fakeClass );
				} );
				it( "If the submitted type is a component return the value of the `component` key", function(){
					var fakeComponent = createStub();
					testme            = testObj.obtainProcessClass( fakeComponent );
					expect( testme ).toBe( fakeCompReturn );
				} );
			}
		);
	}

}
