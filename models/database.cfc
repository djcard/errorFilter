component accessors="true"{
  property name="base" inject="errorFilter@errorFilter";

  function run( err ){
    var retme             = getBase().addKeys( "Database", err );
    if(retme.keyExists("tagContext") && arguments.err.keyExists("tagContext")) {
      retme[ "tagContext" ] = getBase().trimAndFilterTagContext(arguments.err.tagContext);
    }
    retme[ "filterClass" ]        = getMetadata(this).name;
    return retme;
  }

}
