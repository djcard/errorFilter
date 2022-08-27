/***
 * Take a component and tries to return a pure structure of its properties while pruning nodes from a preset list
 *
 **/
component accessors="true" {

	property name="doNotNormalizelist" inject="coldbox:setting:doNotNormalize@errorFilter";
	property name="calledArray";

	if ( isNull( getCalledArray() ) ) {
		setCalledArray( [] );
	};

	/***
	 * The main function
	 *
	 * @err The component to be normalized
	 **/
	function run( required any err ){
		variables.calledArray = [];
		return normalizeNode( err );
	}

	/***
	 * Accepts a passes it off to the appropriate method to normalize it
	 *
	 * @value The variable to be normalized
	 **/
	function normalizeNode( value ){
		if ( isSimpleValue( value ) ) {
			return value;
		} else if ( isObject( value ) ) {
			return normalizeComponent( value );
		} else if ( isArray( value ) ) {
			return normalizeArray( value );
		} else if ( isStruct( value ) ) {
			return normalizeStruct( value );
		} else if ( isClosure( value ) ) {
			return value;
		} else if ( isCustomFunction( value ) ) {
			return value;
		} else {
			writeDump( value );
			writeDump( getMetadata( value ) );
			abort;
			return "no clue";
		}
		return "";
	}


	/***
	 * Accepts a component and first checks for a getMemento function before cycling through its properties in an attempt to normalize them
	 *
	 * @comp The component to be normalized
	 **/
	function normalizeComponent( required any comp ){
		var allMeta = getMetadata( comp );

		if ( variables.calledArray.findNoCase( allMeta.fullname ) != 0 ) {
			return "already rendered #allMeta.fullname#";
		} else {
			var converted    = {};
			// This is returning duplicates but not sure how to prevent that. It's not "right" but it's not "wrong"
			var allFunctions = buildRecursiveFunctions( allMeta );

			if ( componentHasFunction( allFunctions, "getMemento" ) ) {
				converted = comp.getMemento();
			} else {
				allMeta.properties.each( function( item ){
					if ( donotnormalizelist.findNoCase( item.name ) == 0 ) {
						try {
							converted[ item.name ] = normalizeNode( invoke( comp, "get#item.name#" ) );
						} catch ( any err ) {
							converted[ item.name ] = err.message;
						}
					}
				} );
			}
			variables.calledArray.append( allMeta.fullName );
			return normalizeStruct( converted );
		}
	}

	/***
	 * Assembles an array of a components functions and the functions of all of its recursive extends' functions
	 *
	 * @allMeta The metaData structure for a component
	 **/
	function buildRecursiveFunctions( required struct allMeta ){
		var allFunc = [];
		var base    = allMeta;
		while ( !isSimpleValue( base ) ) {
			if ( base.keyExists( "functions" ) ) {
				allFunc.append( base.functions, true );
			}
			base = base.keyExists( "extends" ) ? base.extends : "";
		}

		return allFunc;
	}

	/***
	 * Accepts a structure and cycles through it's keys to normalize them.
	 *
	 **/
	function normalizeStruct( required struct strc ){
		var retme = {};
		strc.keyArray()
			.each( function( item ){
				if ( donotnormalizelist.findNoCase( item ) == 0 ) {
					retme[ item ] = normalizeNode( strc[ item ] );
				}
			} );
		return retme;
	}

	/***
	 * Accepts an array and cycles through its indicies to attempt to normalize them.
	 *
	 * @arry The array to be normalized
	 **/
	function normalizeArray( required array arry ){
		return arry.map( function( item ){
			return normalizeNode( item );
		} );
	}

	/***
	 * Determines whether a component as a function of the name submitted
	 *
	 * @functions    an array of functions from the metaData of a component
	 * @functionName The name of the function to find
	 **/
	function componentHasFunction( required any functions, string functionName = "getMemento" ){
		return arguments.functions
			.filter( function( item ){
				return trim( item.name.lcase() ) == trim( functionName.lcase() );
			} )
			.len() gt 0;
	}

}
