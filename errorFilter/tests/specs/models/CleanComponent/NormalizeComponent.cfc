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
					testobj = createmock( object = getInstance( "cleanComponent@ErrorFilter" ) );

					fakeComponent = createStub();
					fakeComponent.$( method = "getMemento", returns = {} );
					testObj.$( method = "buildRecursiveFunctions", returns = [] );
					testObj.$( method = "normalizeStruct", returns = {} );
				} );
				it( "if component has already been process previously, return a default string", function(){
					testObj.setcalledArray( [ "testbox.system.mockutils.Stub" ] );
					testme = testObj.normalizeComponent( fakeComponent );
					expect( isSimpleValue( testme ) ).tobeTrue();
					expect( testObj.$count( method = "buildRecursiveFunctions" ) ).tobe( 0 );
				} );
				it( "Should call buildRecursiveFunctions 1x", function(){
					testme = testObj.normalizeComponent( fakeComponent );
					expect( testObj.$count( "buildRecursiveFunctions" ) ).tobe( 1 );
				} );
				it( "Should call componentHasFunction 1x", function(){
					testObj.$( method = "componentHasFunction", returns = true );
					testme = testObj.normalizeComponent( fakeComponent );
					expect( testObj.$count( "componentHasFunction" ) ).tobe( 1 );
				} );



				it( "should add the name of the component to the calledArray", function(){
					testme = testObj.normalizeComponent( fakeComponent );
					expect( testObj.getCalledArray().findNoCase( getMetadata( fakeComponent ).fullName ) ).tobe(
						1
					);
				} );

				it( "Should call normalizeStruct 1x", function(){
					testObj.$( method = "normalizeStruct", returns = true );
					testme = testObj.normalizeComponent( fakeComponent );
					expect( testObj.$count( "normalizeStruct" ) ).tobe( 1 );
				} );
				// it( "test", function(){
				//	var start = getTickCount();
				//	testme = testObj.normalizeComponent( getWirebox() );
				//	writeDump(testme);
				//	var endDump = getTickCount();
				//	writeDump(getTickCount()-endDump);
				//	writeDump(serializeJSON(testme));
				//	writeDump(getTickCount()-endDump);
				//	expect( testObj.$count( "normalizeStruct" ) ).tobe( 1 );
				// } );
			}
		);
	}

}
