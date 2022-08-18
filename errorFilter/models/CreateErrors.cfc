component {

    function expressionError() {
        try {
            return 1 + 'a';
        } catch (any err) {
            return err;
        }
    }

    function queryError() {
        try {
            var qs = new query(datasource = 'blah');
            qs.setSql('select * from table');
            return qs.execute().getResult();
        } catch (any err) {
            return err;
        }
    }

    function customError() {
        return {'type': 'myCustom', 'message': 'Blarg'};
    }

}
