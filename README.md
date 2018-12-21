# SLViewer
SAPLink Archive Viewer for OS X

I wrote this for myself in some spare time I had in 2015.  We reduce our lab systems to rubble from time-to-time, and dealing with the reapplication of transports just for the sake of examining sample source code gets tedious.  I also didn't want to reapply SAPLink archives just to look at one or two ABAP classes.  The result is this program.

These days it probably makes more sense to use ABAPGit, but this program can still be handy if you have code in SAPLink files that you would like to reference.

The project is built in Objective-C, as Swift was kind of new when I was writing this.  Presently the project is configured to build on XCode Version 9.4.1 with a target OS X release of 10.11.  Check the other branches if you are running something older.

* This program will read SAPLink archives in either Slinkee or Nugget format and create a SQLite DB containing the unarchived objects in human-readable format.  
* You may import multiple SAPLink files.
* Duplicate objects will be overwritten without warning.
* The imported objects are contained in one 'codebase' - see the overwrite warning.

The only objects supported are ABAP Classes, ABAP Function Groups and ABAP SE38-type programs.  If the source file contains other
object-types, the unsupported objects will be skipped over.  It would be relatively simple to add support for additional object-types,
however most meaningful aspects of ABAP-stack development can be captured with those presently supported.

A notable exclusion is ABAP Repostitory content (DDIC).  

# Testing
A sample Slinkee file is located at ./SLViewer/SLViewerTests/CLAS_ZCL_TEXT_EXPORT5.slnk.  It contains a single ABAP Class of reasonable completeness.

#ToDo
Logical next-steps would be: 
* add class-type leaf in the class object list 
* add support for custom DDIC objects (tables, structures, data-elements, domains)
* create a parser/lexer to permit indexing of the known objects
* use the parser/lexer to color-code the source code
* create a where-used function for known objects
* partition source-code and objects by source-system if known, this could be accomplished by perhaps choosing a DB to connect to, or by creating a new primary-key (SID?) in the extisting entities and adding support for the field in the import modal window / general UI.

# Screenshots
![Testing Instance Running](https://github.com/1414C/SLViewer/raw/master/images/ss1.png "Testing Instance Running")

![Testing Instance Running](https://github.com/1414C/cwl/raw/master/images/Lambda6.jpeg "Testing Instance Running")
