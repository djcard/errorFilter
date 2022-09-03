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
			title  = "run should",
			labels = "automated",
			body   = function(){
				beforeEach( function(){
					testobj = createmock( object = getInstance( "genericItem@ErrorFilter" ) );
				} );
				it( "If given a string, should return the string", function(){
					var submit = mockData( $num = 1, $type = "words:1" )[ 1 ];
					var testme = testobj.run( submit );
					expect( testme ).tobe( submit );
				} );
				it( "If given a struct, should return the struct", function(){
					var key = mockData( $num = 1, $type = "words:1" )[ 1 ];
					var val = mockData( $num = 1, $type = "words:1" )[ 1 ];
					testme  = testobj.run( { "#key#" : val } );
					expect( testme ).tobeTypeOf( "struct" );
					expect( testme ).tohaveKey( key );
					expect( testme[ key ] ).tobe( val );
				} );
				it( "If given an array, should return the array", function(){
					var myArr = [
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ]
					];
					testme = testobj.run( myArr );
					expect( testme ).tobeTypeOf( "array" );
					expect( testme.len() ).tobe( myArr.len() );
					expect( testme[ 1 ] ).tobe( myArr[ 1 ] );
					expect( testme[ 2 ] ).tobe( myArr[ 2 ] );
				} );
			}
		);
	}

}
