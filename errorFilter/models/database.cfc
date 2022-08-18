component accessors="true" {

    property name="base" inject="errorFilter@errorFilter";

    struct function run(err) {
        var retme = getBase().addKeys('Database', err);
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
