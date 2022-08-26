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
					fakeArray = [
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ]
					];

					fakeStruct = {
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ],
						"#mockData( $num = 1, $type = "words:1" )[ 1 ]#" : mockData( $num = 1, $type = "words:1" )[ 1 ]
					};

					testobj = createmock( object = getInstance( "cleanComponent@ErrorFilter" ) );
					testobj.$( method = "normalizeComponent" );
					testobj.$( method = "normalizeArray" );
					testobj.$( method = "normalizeStruct" );

					fakeComponent = createStub();
				} );
				it( "if a component issubmitted, call normalizeComponent 1x", function(){
					testme = testObj.normalizeNode( fakeComponent );
					expect( testObj.$count( "normalizeComponent" ) ).tobe( 1 );
				} );
				it( "if an array is submitted, call normalizeArray 1x", function(){
					testme = testObj.normalizeNode( fakeArray );
					expect( testObj.$count( "normalizeArray" ) ).tobe( 1 );
				} );
				it( "if a struct is submitted, call normalizeStruct 1x", function(){
					testme = testObj.normalizeNode( fakeStruct );
					expect( testObj.$count( "normalizeStruct" ) ).tobe( 1 );
				} );
				it( "if a closure is submitted, return it", function(){
					testme = testObj.normalizeNode( function(){
						return arguments
					} );
					expect( testme ).tobetypeof( "closure" );
				} );
				it( "if a function is submitted, return it", function(){
					testme = testObj.normalizeNode( booyeah );
					expect( testme ).tobetypeof( "function" );
				} );
				it( "if a simple value is submitted, return it", function(){
					testme = testObj.normalizeNode( "hello" );
					expect( testme ).tobe( "hello" );

					testme = testObj.normalizeNode( 55 );
					expect( testme ).tobe( 55 );

					testme = testObj.normalizeNode( now() );
					expect( testme ).tobe( now() );
				} );
			}
		);
	}

	function booyeah(){
	}

}
