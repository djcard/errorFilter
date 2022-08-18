component accessors="true" {

    property name="base" inject="errorFilter@errorFilter";

    /***
     * Process the error through it's default workings
     * @err The passed in error
     * @type The type of error
     **/
    function run(required any err, required string type) {
        var retme = getBase().addKeys(err, err);
        if (retme.keyExists('tagContext') && arguments.err.keyExists('tagContext')) {
            retme['tagContext'] = getBase().trimAndFilterTagContext(arguments.err.tagContext);
        }
        if (retme.keyExists('StackTrace') && arguments.err.keyExists('StackTrace')) {
            retme['StackTrace'] = trimAndFilterStackTrace(arguments.err.StackTrace);
        }
        retme['filterClass'] = getMetadata(this).name;
        return retme;
    }

}
