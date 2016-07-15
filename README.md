# SLViewer
OS X Catalogue SAPLINK archives

This program will read SAPLink archives and create a SQLite DB containing the unarchived objects in human-readable format.  

You may import multiple SAPLink files in either Slinkee or .nugg format.

Duplicate objects will be overwritten without warning.

The code is contained in one 'codebase' - beware!

The only objects supported are ABAP Classes, ABAP Function Groups and ABAP SE38-type programs.  It would be relatively easy to add 
support for others, however most meaningful aspects of ABAP-stack development can be captured with the presently supported objects.
A notable exclusion is ABAP Repostitory content (DDIC).  It would be possible to add support for customer DDIC elements, domains, strucures
and tables.

A logical next-step would be to write a parser/indexer to faciliate the creation of a where-used function.
You could also use this to better color-code the text.

