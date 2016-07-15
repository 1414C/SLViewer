# SLViewer
SAPLink Archive Viewer for OS X

I wrote this for myself in some spare time I had last year.  We reduce our lab systems to rubble from time-to-time, and dealing with the reapplication of transports just for the sake of examining sample source code gets tedious.  I also didn't want to reapply SAPLink archives just to look at one or two ABAP classes.  The result is this program.

The project is built in Objective-C, as Swift was kind of new when I was writing this.  Presently the project is configured to build on XCode 7.0 with a target OS X release of 10.11.  When I update to XCode 8.x I will create a fork and make the required changes there for 10.11 and 10.12.

This program will read SAPLink archives and create a SQLite DB containing the unarchived objects in human-readable format.  

You may import multiple SAPLink files in either Slinkee or Nugget format.

Duplicate objects will be overwritten without warning.

The imported objects are contained in one 'codebase' - see the overwrite warning.

The only objects supported are ABAP Classes, ABAP Function Groups and ABAP SE38-type programs.  It would be relatively simple to add 
support for others, however most meaningful aspects of ABAP-stack development can be captured with the presently supported objects.
A notable exclusion is ABAP Repostitory content (DDIC).  It would be possible to add support for customer DDIC elements, domains, strucures
and tables.

Logical next-steps would be: 
* add class-type leaf in the class object list 
* add support for custom DDIC objects (tables, structures, data-elements, domains)
* create a parser/lexer to permit indexing of the known objects
* use the parser/lexer to color-code the source code
* create a where-used function for known objects
* partition source-code and objects by source-system if known, this could be accomplished by perhaps choosing a DB to connect to, or by creating a new primary-key (SID?) in the extisting entities and adding support for the field in the import modal window / general UI.

