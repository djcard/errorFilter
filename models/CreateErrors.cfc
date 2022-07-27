component {
    function expressionError( shouldRethrow=true){
      writedump(var="*********************************",output="console");
      writedump(var="firing expression Error",output="console");
      try {
        return 1 + "a";
      }
      catch(any err){
        writedump(var="Expression Error Caught",output="console");
        return err;
      }

    }

  function queryError(){
    try {
      var qs = new query(datasource = "blah");
      qs.setSql("select * from table");
      return qs.execute().getResult();
    } catch(any err){
      return err;
    }
  }

  function customError(){
    return {
      "type":"myCustom",
      "message": "Blarg"
    };
  }
}
