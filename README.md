# SLViewer
SAPLink Archive Viewer for macOS

I wrote this for myself in some spare time I had in 2015.  Dealing with the reapplication of transports just for the sake of examining sample source code gets tedious.  I also didn't want to reapply SAPLink archives just to look at one or two ABAP classes.  The screens are designed to look like their old SAPGui equivalents.

These days it probably makes more sense to use ABAPGit with Eclipse, but this program can still be handy if you have code in SAPLink files that you would like to reference.

The project is built in Objective-C, as Swift was kind of new when I was writing this.  Presently the released application is built on XCode Version 11.5 (11E608c), with a base SDK of macOS 10.15 and a target macOS release of 10.12.  This should allow most macs to run SLViewer without having to download and adjust the code or project settings.

* This program will read SAPLink archives in either Slinkee or Nugget format and create a SQLite DB containing the unarchived objects in human-readable format.  
* You may import multiple SAPLink files.
* Duplicate objects will be overwritten without warning.
* The imported objects are contained in one 'codebase' - see the overwrite warning.
* Files must be encoded as UTF-8.  If the upload of your SAPLink artifacts fails, the cause is probably the file encoding.

The only objects supported are ABAP Classes, ABAP Function Groups and ABAP SE38-type programs.  If the source file contains other
object-types, the unsupported objects will be skipped over.  It would be relatively simple to add support for additional object-types,
however most meaningful aspects of ABAP-stack development can be captured with those presently supported.  * this is no longer true, as ABAP CDS views are both powerful and pervasive...

A notable exclusion is ABAP Repostitory content (DDIC).  

# Testing
A sample Slinkee file is located at ./SLViewer/SLViewerTests/CLAS_ZCL_TEXT_EXPORT5.slnk.  It contains a single ABAP Class of reasonable completeness.

#ToDo
Logical next-steps would be:
* add support for ABAPGit
* add class-type leaf in the class object list 
* add support for custom DDIC objects (tables, structures, data-elements, domains)
* add support for CDS, but you know - eclipse...
* create a parser/lexer to permit indexing of the known objects
* use the parser/lexer to color-code the source code
* create a where-used function for known objects
* partition source-code and objects by source-system if known, this could be accomplished by perhaps choosing a DB to connect to, or by creating a new primary-key (SID?) in the existing entities and adding support for the field in the import modal window / general UI.
* add support for dark mode

# Screenshots
![Class Method Display](https://github.com/1414C/SLViewer/raw/master/images/ss1.png "Class Method Display")
Class Method Display

<br>

![Class Attribute Display](https://github.com/1414C/SLViewer/raw/master/images/ss2.png "Class Attribute Display")
Class Attribute Display

<br>

![Class Properties Display](https://github.com/1414C/SLViewer/raw/master/images/ss3.png "Class Properties Display")
Class Properties Display

<br>

![Function Module Display](https://github.com/1414C/SLViewer/raw/master/images/ss4.png "Function Module Display")
Function Module Display

<br>

![Function Group Properties Display](https://github.com/1414C/SLViewer/raw/master/images/ss5.png "Function Group Properties Display")
Function Group Properties Display



