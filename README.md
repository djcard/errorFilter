# ErrorFilter
A Coldbox Module to filter error messages to remove unwanted fields and items in the tagContext array to reduce noise and make error items more readable.

##Installation:

`box install errorFilter`

##Usage: 

The simplest usage is to instantiate the errorFilter model ( `getInstance(errorFilter@errorFilter`) )
and pass any error received through the run() method before passing that on to logbox or whereever you are inclined to send it. 
ErrorFilter will strip out any keys not explicitly stated in the settings. These keys differ based on the type
of error ( i.e. database, expression ). 

Most of the keys in the error structures are simple variables, but the TagContext key is an array of structs. Many times this array
has items which are clearly outside of immediate purview of the error. For example, when debugging a Coldbox module in development,
seeing the calls from code from inside Coldbox, Testbox or other frameworks can be occasioanlly be helpful but it mode likely than not simply noise that can be filtered out. Error Filter
also can filter out both entries fitting a certain pattern and limit the length of the tagContext array. 

##Properties


Struct errorClasses: The component which handles filtering the error. 

Struct typeFields: keys are the type of error and the values are the fields to include in the output for that type

numeric tagContextLines: The maximum length of the tagContext array

String (command separated list) tagContextFields: The fields to include in each tagContext entry

Array of strings filterPhrases: The key phrases uses to filter out tagContext entries

##Handling Custom Errors

It is possible to configure ErrorFilter to handle custom errors.

1. Add a key to the 'typeFields' property of the name of the error type and the value of the keys to include in the output. 

2. Add a key to the 'errorClasses' property of the name of the error type and the name of the class which will handle it. This can be an existing model in errorFilter or another component. To make a new component, it is easier to duplicate one of the exiting components (database, expression etc) and adapt it. 


