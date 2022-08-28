# ErrorFilter
A ColdBox Module to filter error messages to remove unwanted fields and items in the tagContext array to reduce noise and make error items more readable. 

Note: Based on ideas and work from John Wilson at Synaptrix! Thanks!

## Installation:

`box install errorFilter`

## Usage: 

The simplest usage is to instantiate the errorFilter model ( `getInstance(errorFilter@errorFilter`) )
and pass any error or logging object  through the run() method before passing that on to logbox or wherever you are inclined to send it. 
For errors, ErrorFilter will strip out any keys not explicitly stated in the settings. These keys differ based on the type
of error ( i.e. database, expression ). For Components, it will try to "normalize" them by converting the component to a struct of its properties, stripping out
keys that notoriously take a long time to serialize such as testbox, wirebox, coldbox and so on. If a generic struct is submitted, it will return the struct as is. 

Most of the keys in the error structures are simple variables, but the TagContext key is an array of structs. Many times this array
has items which are clearly outside of immediate purview of the error. For example, when debugging a ColdBox module in development,
seeing the calls from code from inside ColdBox, TestBox or other frameworks can occasionally be helpful but, more likely than not, it is simply noise which can be filtered out. Error Filter
also can both filter out entries fitting a certain pattern and limit the length of the tagContext array. 

The stackTrace key in an error is a long string which outputs the stackTrace. If ErrorFilter displays that string, it attempts
to break it into an array using "#chr(9)#at " as the delimiter. This roughly splits it at the "at". 

## Properties


errorClasses - Struct: A dictionary of component which handles filtering the error. 

typeFields - Struct: keys are the type of error and the values are the fields to include in the output for that type

tagContextLines - numeric: The maximum length of the tagContext array

tagContextFields - String (comma separated list) : The fields to include in each tagContext entry

filterPhrases - Array of strings : The key phrases used to filter out tagContext entries

removeAllBlankLines - Boolean: When filtering an error, will remove all keys with empty strings as the value

doNotNormalize - comma separated list : a list of keyNames for the componant normalizer to skip. defaults to  "testbox,coldbox,wirebox,cachebox,logbox,this"

## Handling Custom Errors

It is possible to configure ErrorFilter to handle custom errors.

1. Add a key to the 'typeFields' property of the name of the error type and the value of the keys to include in the output. 

2. Add a key to the 'errorClasses' property of the name of the error type and the name of the class which will handle it. This can be an existing model in errorFilter or another component. To make a new component, it is easier to duplicate one of the exiting components (database, expression etc) and adapt it.

## Default Settings
```
        {
            typeFields : {
        		"Database" : "Datasource,Detail,ErrorCode,Message,NativeErrorCode,stackTrace,Sql,SqlState,Type,type,where",
        		"Expression": "Message,Detail,ErrNumber,ErrorCode,Extended_Info,ExtendedInfo,stackTrace,Type,TagContext",
        		"general": "Message,Detail,stackTrace,tagContext"
      		},
      		filterPhrases : [ "/modules/", "/lucee", "coldbox/system", "/testbox/" ],
      		errorClasses : {
        		"Database"   : "database@errorFilter",
        		"Expression" : "expression@errorFilter",
        		"Any"        : "general@errorFilter"
      		},
      		"tagContextLines" : 3,
      		"tagContextFields" : "codePrintPlain,line,template",
      		"removeAllBlankLines" : false,
      		"doNotNormalize" : "testbox,coldbox,wirebox,cachebox,logbox,this"
      	}
```


