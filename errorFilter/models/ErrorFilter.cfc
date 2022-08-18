/**
 * A extendable module to filter the contents of an error message
 *
 **/
component accessors="true" {

	property name="typeFields"          inject="coldbox:setting:typeFields@errorFilter";
	property name="tagContextLines"     inject="coldbox:setting:tagContextLines@errorFilter";
	property name="tagContextFields"    inject="coldbox:setting:tagContextFields@errorFilter";
	property name="errorClasses"        inject="coldbox:setting:errorClasses@errorFilter";
	property name="filterPhrases"       inject="coldbox:setting:filterPhrases@errorFilter";
	property name="removeAllBlankLines" inject="coldbox:setting:removeAllBlankLines@errorFilter";
	property name="wirebox"             inject="wirebox";

	/**
	 * The main method of the module
	 *
	 * @error The error to be filtered
	 **/
	function run( required error ){
		var processClassName = obtainProcessClass( error );
		return wirebox.containsInstance( processClassName )
		 ? wirebox.getInstance( processClassName ).run( error )
		 : {};
	}

	/**
	 * Tries to determine which class to use to filter the error based on the type key
	 *
	 * @error The error to be typed
	 **/
	function obtainProcessClass( required error ){
		return error.keyExists( "type" ) && geterrorClasses().keyExists( error.type )
		 ? getErrorClasses()[ error.type ]
		 : getErrorClasses()[ "any" ];
	}

	/**
	 * Attempts to use the tagContext key to return the template and line number
	 *
	 * @tagContext The array of structs corresponding to the tagContext key in the error
	 */
	function addLine( required array tagContext ){
		var returnLine = tagContext.len() && isStruct( tagContext[ 1 ] ) && tagContext[ 1 ].keyExists( "template" ) ? tagContext[
			1
		].template : "";
		return returnline.len() && tagContext[ 1 ].keyExists( "line" ) ? returnLine & " ( " & tagContext[ 1 ].line & " )" : returnLine;
	}

	/**
	 * Adds the default fields for the error type to a structure to be returned
	 *
	 * @type The
	 **/
	function addKeys( required string type, required error ){
		var retme     = {};
		var fieldList = gettypeFields().keyExists( arguments.type ) ? gettypeFields()[ arguments.type ].listToArray() : [];
		fieldList.each( function( item ){
			if ( error.keyExists( trim( item ) ) ) {
				if (
					getRemoveAllBlankLines() && isSimpleValue( error[ trim( item ) ] ) && trim(
						toString( error[ trim( item ) ] )
					).len() == 0
				) {
				} else {
					retme[ trim( item ) ] = error[ trim( item ) ];
				}
			}
		} );
		return retme;
	}

	/**
	 * Filters out elements of the tagContext based on search strings defined in the moduleConfig
	 *
	 * @tagContext
	 **/
	function filterTagContext( required array tagContext = [] ){
		return arguments.tagcontext.filter( function( e ){
			var findings = getfilterPhrases().map( function( item ){
				return e.template.replace( "\", "/", "all" ).findNoCase( item );
			} );

			return findings.sum() == 0;
		} );
	}

	/**
	 * Trims the tagContext array of structs to the limit defined in the moduleSettings tagContextLines property
	 * Each tagContext item will include the fields in the moduleSettings.tagContextFields property
	 *
	 * @tagContext - The array of structs corresponding to the tag context. Note: Should have already passed through filterTagContext()
	 */

	function trimTagContext( required array tagContext = [] ){
		return tagContext.len()
		 ? tagContext
			.slice(
				1,
				( arguments.tagContext.len() >= gettagContextLines() ) ? gettagContextLines() : arguments.tagContext.len()
			)
			.map( function( e ){
				var retme = {};
				gettagContextFields().each( function( item ){
					retme[ item ] = e.keyExists( item ) ? e[ item ] : "";
				} );
				return retme;
			} )
		 : [];
	}

	function trimAndFilterTagContext( required array tagContext ){
		return trimTagContext( filterTagContext( arguments.tagContext ) );
	}

	function trimAndFilterStackTrace( required string stackTrace ){
		return stackTrace.listToArray( delimiters = "#chr( 9 )#at ", multiCharacterDelimiter = true );
	}

}
