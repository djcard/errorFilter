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
					fakeArray = [
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ],
						mockData( $num = 1, $type = "words:1" )[ 1 ]
					];


					errorFilter = createmock( object = getInstance( "errorFilter@ErrorFilter" ) );
					errorFilter.$( method = "addKeys", returns = {} );
					errorFilter.$( method = "trimAndFilterTagContext", returns = [] );
					errorFilter.$( method = "trimAndFilterStackTrace", returns = [] );
					testobj = createmock( object = getInstance( "BaseFilter@ErrorFilter" ) );
					testobj.setBase( errorFilter );
				} );
				it( "Should call addKeys 1x", function(){
					testme = testObj.run( {}, "" );
					expect( errorFilter.$count( "addKeys" ) ).tobe( 1 );
				} );
				it( "If there is no tagContext, run trimAndFilterTagContext 0x", function(){
					testme = testObj.run( {}, "" );
					expect( errorFilter.$count( "trimAndFilterTagContext" ) ).tobe( 0 );
				} );
				it( "If there is no tagContext, run trimAndFilterTagContext 0x", function(){
					errorFilter.$( method = "addKeys", returns = { tagContext : [] } );
					testme = testObj.run( { tagContext : "" }, "" );
					expect( errorFilter.$count( "trimAndFilterTagContext" ) ).tobe( 1 );
				} );
				it( "If there is no stackTrace, run trimAndFilterStackTrace 0x", function(){
					testme = testObj.run( {}, "" );
					expect( errorFilter.$count( "trimAndFilterStackTrace" ) ).tobe( 0 );
				} );
				it( "If there is no stackTrace, run trimAndFilterStackTrace 0x", function(){
					errorFilter.$( method = "addKeys", returns = { stackTrace : [] } );
					testme = testObj.run( { stackTrace : "" }, "" );
					expect( errorFilter.$count( "trimAndFilterStackTrace" ) ).tobe( 1 );
				} );
			}
		);
	}

}
