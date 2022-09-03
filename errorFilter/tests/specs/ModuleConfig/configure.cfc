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
					typeFields = {
						"Database"   : "Datasource,Detail,ErrorCode,Message,NativeErrorCode,stackTrace,Sql,SqlState,Type,type,where",
						"Expression" : "Message,Detail,ErrNumber,ErrorCode,Extended_Info,ExtendedInfo,stackTrace,Type,TagContext",
						"general"    : "Message,Detail,stackTrace,tagContext"
					};
					filterPhrases = [
						"/modules/",
						"/lucee",
						"coldbox/system",
						"/testbox/"
					];
					doNotNormalize   = "testbox,coldbox,wirebox,cachebox,logbox,this";
					tagContextFields = "codePrintPlain,line,template";
					testme           = getController().getConfigSettings().moduleSettings.errorFilter;
					errorClasses     = {
						"Database"    : "database@errorFilter",
						"Expression"  : "expression@errorFilter",
						"Any"         : "general@errorFilter",
						"component"   : "cleanComponent@errorFilter",
						"genericItem" : "genericItem@errorFilter"
					};
				} );
				it( "should have an typeFields key", function(){
					expect( testme ).tohaveKey( "typeFields" );
				} );
				it( "The typeFields key should have a key for each scribe typefields", function(){
					testme.typefields.each( function( item ){
						expect( typeFields ).tohaveKey( item );
						expect( testme.typeFields[ item ] ).tobe( typefields[ item ] );
					} );
				} );
				it( "should have an filterphrases key", function(){
					expect( testme ).tohaveKey( "filterPhrases" );
				} );
				it( "The filterPhrases key should have a key for each errorFilter filterPhrase", function(){
					var allmissfit = testme.filterPhrases.filter( function( item ){
						return filterPhrases.findNoCase( item ) == 0;
					} );
					expect( testme.filterPhrases.len() ).tobe( filterPhrases.len() );
					expect( allmissfit.len() ).tobe( 0 );
				} );
				it( "should have an doNotNormalize key", function(){
					expect( testme ).tohaveKey( "doNotNormalize" );
					expect( testme.doNotNormalize ).tobe( doNotNormalize );
				} );
				it( "should have a tagContextFields key", function(){
					expect( testme ).tohaveKey( "tagContextFields" );
					expect( testme.tagContextFields ).tobe( tagContextFields );
				} );
				it( "should have a removeAllBlankLines key", function(){
					expect( testme ).tohaveKey( "removeAllBlankLines" );
					expect( testme.removeAllBlankLines ).tobe( false );
				} );
				it( "should have a tagContextLines key", function(){
					expect( testme ).tohaveKey( "tagContextLines" );
					expect( testme.tagContextLines ).tobe( 3 );
				} );
				it( "should have an errorClasses key", function(){
					expect( testme ).tohaveKey( "errorClasses" );
				} );
				it( "The errorClasses key should have a key for each scribe errorClasses", function(){
					testme.errorClasses.each( function( item ){
						expect( errorClasses ).tohaveKey( item );
						expect( testme.errorClasses[ item ] ).tobe( errorClasses[ item ] );
					} );
				} );
			}
		);
	}

}
