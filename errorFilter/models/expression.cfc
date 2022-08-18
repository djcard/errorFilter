component accessors="true" {

    property name="base" inject="errorFilter@errorFilter";

    function run(err) {
        var retme = getBase().addKeys('expression', err);
        if (retme.keyExists('tagContext')) {
            retme['tagContext'] = getBase().trimAndFilterTagContext(arguments.err.tagContext);
        }
        retme['filterClass'] = getMetadata(this).name;
        return retme;
    }

}
