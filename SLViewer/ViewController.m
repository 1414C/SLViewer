//
//  ViewController.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-01.
//
///////////////////////////////////////////////////////////////////////////////////////
// The MIT License (MIT) - see LICENSE.md
//
// Copyright (c) 2016 Steve MacLeod
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//////////////////////////////////////////////////////////////////////////////////////

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // listen for a slinkee open request from
    // the appdelegate
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(openSlinkee) name:kOpenSlinkeeRequest object:nil];
    
    [nc addObserver:self selector:@selector(reactToDBPurge) name:kDBPurgeCompleted object:nil];
    
    // [nc addObserver:self selector:@selector(loadABAPClasses) name:kLoadABAPClassesRequest object:nil];
    
    [_comboObjectSelection setDelegate:self];
    [_comboSortSelection setDelegate:self];
    
    _selectedNode = nil;
    
    // ensure presentation order of childObjects based on index
    // _childSD = [[NSSortDescriptor alloc]initWithKey:@"index" ascending:YES];
    
    _arrayData = [[NSMutableArray alloc]init];
    
//    [_searchField setSendsSearchStringImmediately:NO];
//    [_searchField setSendsWholeSearchString:NO];
    DLog(@"send search string immediately %d",_searchField.sendsSearchStringImmediately);
    DLog(@"sends whole search string %d",_searchField.sendsWholeSearchString);
    
    [_fillerSegmentView setWantsLayer:YES];
    [_fillerSegmentView.layer setMasksToBounds:YES];
    [_fillerSegmentView.layer setBorderWidth:1.0f];
    [_fillerSegmentView.layer setBorderColor:[[NSColor lightGrayColor]CGColor]];

    NSDistributedNotificationCenter *ndc = [NSDistributedNotificationCenter defaultCenter];
    [ndc addObserver:self selector:@selector(updateImportLogger:) name:kImportLogMsg object:nil];

    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


-(void)updateImportLogger:(NSNotification*)notification
{
    NSDictionary *d = [notification userInfo];
    _txtImportLog.stringValue = [d objectForKey:@"importMsg"];
}


-(void)reactToDBPurge
{
    [self loadABAPClassesWithSearchText:nil];
}


#pragma mark - object loading methods
// used by the NSComboBox notification
// and at the completion of importing
// objects.
// load M_ABAPClasses
-(void)loadABAPClassesWithSearchText:(NSString*)searchText
{
    _activeSAPABAPType = C_SAPABAPType_CLAS;
    
    DataManager *dMgr = [DataManager sharedCollectionMgr];
    
    if(searchText && [searchText length] >0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(clsname like %@)",searchText];
        _classArray = [[NSMutableArray alloc]initWithArray:[dMgr getABAPClassesForPredicate:predicate] copyItems:NO];
    }
    else
    {
        _classArray = [[NSMutableArray alloc]initWithArray:[dMgr getAllABAPClasses] copyItems:NO];
    }
    
    
    if([_comboSortSelection.objectValueOfSelectedItem isEqualToString:C_ZtoA])
    {
        _objectSD = [[NSSortDescriptor alloc]initWithKey:@"clsname" ascending:NO];
    }
    else
    {
        _objectSD = [[NSSortDescriptor alloc]initWithKey:@"clsname" ascending:YES];
    }
    
    [_classArray sortUsingDescriptors:[NSArray arrayWithObject:_objectSD]];
    
    _fugrArray = nil;
    _progArray = nil;
    
    
    // build the outline content using NSTreeNodes
    ABAPOutlineContent *oc = [[ABAPOutlineContent alloc]init];
    NSMutableArray *arrayContent = [[NSMutableArray alloc]initWithArray:[oc buildClassContentArrayFromRef:&_classArray] copyItems:NO];
    
    self.dataModel = arrayContent;
}




// load M_ABAPFugr
-(void)loadABAPFUGRWithSearchText:(NSString*)searchText
{
    _activeSAPABAPType = C_SAPABAPType_FUGR;
    
    DataManager *dMgr = [DataManager sharedCollectionMgr];
    
    if(searchText && [searchText length] >0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(area like %@)",searchText];
        _fugrArray = [[NSMutableArray alloc]initWithArray:[dMgr getABAPFugrForPredicate:predicate] copyItems:NO];
    }
    else
    {
        _fugrArray = [[NSMutableArray alloc]initWithArray:[dMgr getAllABAPFugr] copyItems:NO];
    }
    
    
    if([_comboSortSelection.objectValueOfSelectedItem isEqualToString:C_ZtoA])
    {
        _objectSD = [[NSSortDescriptor alloc]initWithKey:@"area" ascending:NO];
    }
    else
    {
        _objectSD = [[NSSortDescriptor alloc]initWithKey:@"area" ascending:YES];
    }
    
    [_fugrArray sortUsingDescriptors:[NSArray arrayWithObject:_objectSD]];
    
    _classArray = nil;
    _progArray = nil;
    
    
    // build the outline content using NSTreeNodes
    ABAPOutlineContent *oc = [[ABAPOutlineContent alloc]init];
    NSMutableArray *arrayContent = [[NSMutableArray alloc]initWithArray:[oc buildFugrContentArrayFromRef:&_fugrArray] copyItems:NO];
    
    self.dataModel = arrayContent;
}

// load M_ABAPPrograms
-(void)loadABAPProgramsWithSearchText:(NSString*)searchText
{
    _activeSAPABAPType = C_SAPABAPType_PROG;
    
    DataManager *dMgr = [DataManager sharedCollectionMgr];
    
    if(searchText && [searchText length] >0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name like %@)",searchText];
        _progArray = [[NSMutableArray alloc]initWithArray:[dMgr getABAPProgramsForPredicate:predicate] copyItems:NO];
    }
    else
    {
        _progArray = [[NSMutableArray alloc]initWithArray:[dMgr getAllABAPPrograms] copyItems:NO];
    }
    
    
    if([_comboSortSelection.objectValueOfSelectedItem isEqualToString:C_ZtoA])
    {
        _objectSD = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:NO];
    }
    else
    {
        _objectSD = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    }
    
    [_progArray sortUsingDescriptors:[NSArray arrayWithObject:_objectSD]];
    
    _classArray = nil;
    _fugrArray = nil;
    
    // build the outline content using NSTreeNodes
    ABAPOutlineContent *oc = [[ABAPOutlineContent alloc]init];
    NSMutableArray *arrayContent = [[NSMutableArray alloc]initWithArray:[oc buildProgContentArrayFromRef:&_progArray] copyItems:NO];
    
    self.dataModel = arrayContent;
}



#pragma mark - NSComboBox delegate methods
- (void)comboBoxSelectionDidChange:(NSNotification *)notification
{
    // Classes / Interfaces selected
    if([_comboObjectSelection.objectValueOfSelectedItem isEqualToString:C_ClassInterfaces_value])
    {
        // contained to handle refresh / reload requests
        if([[_searchField stringValue]length] >0)
        {
            [self loadABAPClassesWithSearchText:[_searchField stringValue]];
        }
        else
        {
            [self loadABAPClassesWithSearchText:nil];
        }
    }
    
    
    // Function Groups selected
    if([_comboObjectSelection.objectValueOfSelectedItem isEqualToString:C_FunctionGroups_value])
    {
        // contained to handle refresh / reload requests
        if([[_searchField stringValue]length] >0)
        {
            [self loadABAPFUGRWithSearchText:[_searchField stringValue]];
        }
        else
        {
            [self loadABAPFUGRWithSearchText:nil];
        }
    }
    
    
    // SE38 programs selected
    if([_comboObjectSelection.objectValueOfSelectedItem isEqualToString:C_Programs_value])
    {
        // contained to handle refresh / reload requests
        if([[_searchField stringValue]length] >0)
        {
            [self loadABAPProgramsWithSearchText:[_searchField stringValue]];
        }
        else
        {
            [self loadABAPProgramsWithSearchText:nil];
        }
    }
    
    
    // import SAPLinkFile selected
    if([_comboObjectSelection.objectValueOfSelectedItem isEqualToString:C_Import_SAPLinkFile])
    {
        [self openSlinkee];
        [_comboObjectSelection selectItemWithObjectValue:C_ClassInterfaces_value];
    }
}



// also opens nugget files
- (IBAction)updateFilter:(id)sender
{
    DLog(@"%@",[_searchField stringValue]);
    NSString *searchString = [NSString stringWithFormat:@"%@*",[_searchField stringValue]];
    switch (_activeSAPABAPType)
    {
        case C_SAPABAPType_CLAS:
        {
            [self loadABAPClassesWithSearchText:searchString]; //[_searchField stringValue]];
        }
            break;
            
        case C_SAPABAPType_FUGR:
        {
            [self loadABAPFUGRWithSearchText:searchString]; //[_searchField stringValue]];
        }
            break;
            
        case C_SAPABAPType_PROG:
        {
            [self loadABAPProgramsWithSearchText:searchString]; //[_searchField stringValue]];
        }
            break;
            
        default:
            break;
    }
    
}



-(void)openSlinkee
{
    NSString *strFileType;    // utf-8 or iso8859-1 for now
    NSMutableString *fixitString;
    NSData *data;
    NSRange range;
    
    range.location = 0;
    range.length = 300;
    
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:YES];
    
    // cleanup anything that was lingering
    fileData = nil;
    _arrayData = [[NSMutableArray alloc]init];
    
    // start of NSOpenPanel customizing experiment
    NSRect vRect;
    vRect.size.height = 30;
    vRect.size.width = 250;
    NSView *rView = [[NSView alloc]initWithFrame:vRect];
    NSRect rect;
    rect.origin.x = 10;
    rect.origin.y = 6;
    rect.size.height = 20;
    rect.size.width = 100;
    NSComboBox *testCB = [[NSComboBox alloc]initWithFrame:rect];
    [rView addSubview:testCB];
    NSRect tRect;
    tRect.origin.x = 120;
    tRect.origin.y = 3;
    tRect.size.height = 20;
    tRect.size.width = 150;
    NSTextField *lblTest = [[NSTextField alloc]initWithFrame:tRect];
    [lblTest setStringValue:@"Enter or select group"];
    [lblTest setEditable:NO];
    [lblTest setEnabled:YES];
    [lblTest setDrawsBackground:NO];
    [lblTest setBezeled:NO];
    [lblTest setSelectable:NO];
    [rView addSubview:lblTest];
    [panel setAccessoryView:rView];
    // end of NSOpenPanel customizing experiment
    
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSFileHandlingPanelOKButton)
    {
        // clear the right-hand-side of the split view
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:kDropRHSubview object:self];
        
        
        for (NSURL *url in [panel URLs])
        {
            // load the file
            NSError *error = nil;
            
            
            // Load the file and check the result
#pragma mark - 10.11 update
            // smacleod - 2016-07-15 - it would be nicer to use [url absoluteString] rather than implcit cast of url
            // but there is a bug related to NSPOSIXErrorDomain - code 2 with this call.  Seems to be related to
            // changes that occured in the update to XCode 7.x.  Although the call would still work, it does
            // throw an error resulting in an alert.  this is confusing as the file actually continues to
            // import.  For now use the raw url and accept the linter warning....
#pragma mark - 10.11 upate end
                fileData = [NSData dataWithContentsOfFile: url                       // [url absoluteString]
                                                  options:NSDataReadingUncached
                                                    error:&error];
          
            
            
            if(error)
            {
                // cleanup and popup
                DLog(@"Error %@", error);
                NSAlert *alert = [[NSAlert alloc] init];
                [alert addButtonWithTitle:@"OK"];
                [alert setMessageText:@"Alert"];
                [alert setInformativeText:@"Problem opening file"];
#pragma mark - 10.12 udpate
                //[alert setAlertStyle:NSCriticalAlertStyle];
                [alert setAlertStyle:NSAlertStyleCritical];
#pragma mark - 10.12 udpate end
                [alert beginSheetModalForWindow:[[self view]window] completionHandler:^(NSModalResponse returnCode) {
                    if (returnCode == NSModalResponseOK)
                    {
                        DLog(@"(returnCode == NSOKButton)");
                    }
                    else if (returnCode == NSModalResponseCancel)
                    {
                        DLog(@"(returnCode == NSCancelButton)");
                    }
                    else
                    {
                        DLog(@"All Other return code %ld",(long)returnCode);
                    }
                    return;
                }];
            }
            
            
            // so file encoding detection is a real pain.  the following method can be used to see
            // if the encoding can be detected based on the file content. odds are that this will
            // not work, and the code is shown as a self-reminder of why the subsequent code exists.
            // if you are looking at this, it is likely due to the a problem encountered while reading
            // a SAPLink file...  Try opening the problem file in Windows TextEdit and saving as UTF-8.
            // A TERRIBLE solution, but this thing was written a year ago in my spare time, so feel
            // free to make improvements :)
            // NSStringEncoding *usedEncoding = nil;
            // NSString *fileWithUsedEncoding = [NSString stringWithContentsOfFile:url usedEncoding:usedEncoding error:&error];
            
            
            // first try with UTF-8 / UTF-16
            NSString *fileContentString = [NSString stringWithContentsOfURL:url  encoding:NSUTF8StringEncoding error:&error];
            if(fileContentString)
            {
                strFileType = @"utf-8";
                fixitString = [[NSMutableString alloc]initWithString:fileContentString];
                [fixitString replaceOccurrencesOfString:@"utf-16" withString:@"utf-8"
                                                options:NSCaseInsensitiveSearch
                                                  range:range];
                
                data = [fixitString dataUsingEncoding:NSUTF8StringEncoding];
            }
            
            // second try with iso8859-1
            else
            {
                strFileType = @"iso8859-1";
                fileContentString = [NSString stringWithContentsOfURL:url encoding:NSISOLatin1StringEncoding error:&error];
                if(fileContentString)
                {
                    // since SAPLink seems to write utf-16 into the xml a lot
                    // lets just make sure that it is not going to trip us up
                    fixitString = [[NSMutableString alloc]initWithString:fileContentString];
                    [fixitString replaceOccurrencesOfString:@"utf-16" withString:@"iso8859-1"
                                                    options:NSCaseInsensitiveSearch
                                                      range:range];
                    
                    data = [fixitString dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:NO];
                }
                
                else
                {
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert addButtonWithTitle:@"OK"];
                    [alert setMessageText:@"Alert"];
                    [alert setInformativeText:@"Unable to determine the file encoding]"];
#pragma mark - 10.12 udpate
                    // [alert setAlertStyle:NSCriticalAlertStyle];
                    [alert setAlertStyle:NSAlertStyleCritical];
#pragma mark - 10.12 udpate end
                    [alert beginSheetModalForWindow:[[self view]window] completionHandler:^(NSModalResponse returnCode) {
                        if (returnCode == NSModalResponseOK)
                        {
                            DLog(@"(returnCode == NSOKButton)");
                        }
                        else if (returnCode == NSModalResponseCancel)
                        {
                            DLog(@"(returnCode == NSCancelButton)");
                        }
                        else
                        {
                            DLog(@"All Other return code %ld",(long)returnCode);
                        }
                        return;
                    }];
                }
            }
            
            
            if(data)
            {
                // do not dispatch individual requests
                // [NSThread detachNewThreadSelector:@selector(bgParserWithData:) toTarget:self withObject:data];
                [_arrayData addObject:data];
                data = nil;
            }
            
            
            if(fileContentString)
            {
                
            }
            
            // parse the tags
        }
        
        if([_arrayData count] >0)
        {
            [NSThread detachNewThreadSelector:@selector(bgParserWithDataArray:) toTarget:self withObject:_arrayData];
        }
    }
}


// parse the buffered data package
-(void)bgParserWithDataArray:(NSMutableArray*)xmlDataArray
{
    for(NSData *d in xmlDataArray)
    {
        [self bgParserWithData:d];
    }
}


// parse the buffered data on a new thread
-(void)bgParserWithData:(NSData*)xmlData
{
    NSError *lclError = nil;
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    
    // Create an instance of the parser delegate and assign
    ABAPClassXMLParser *parserDelegate = [[ABAPClassXMLParser alloc] init];
    
    [parser setDelegate:parserDelegate];
    
    // parserDelegate will use a protocol to send the assembled
    // ABAPClass back to this viewController
    [parserDelegate setDelegate:self];
    
    
    // Invoke the parser and check the result
    [parser parse];
    lclError = [parser parserError];
    
    if(lclError)
    {
        DLog(@"PARSER ERROR: %@",lclError);
    }

}


#pragma mark - <ABAPXMLClassParserDelegate> implementations
// called from parserDelegate instance when parserDidEndDocument
// is reached (end of parsing)
-(void)parserDidFinishWithClass:(M_ABAPClass*)abapClass
{
    DLog(@"abapClass loaded: %@",[abapClass clsname]);
//    _classArray = [[NSMutableArray alloc]initWithObjects:abapClass, nil];
//    [self loadOutlineTest:self];
//    [_myOutlineView selectRowIndexes:[NSIndexSet indexSetWithIndex:(NSUInteger)0] byExtendingSelection:NO];
}

-(void)parserDidFinishWithFugr:(M_ABAPFugr*)abapFugr
{
    DLog(@"abapFugr loaded: %@",[abapFugr name]);
}

-(void)parserDidFinishWithProgram:(M_ABAPProgram*)abapProgram
{
    DLog(@"abapProgram loaded: %@",[abapProgram name]);
}

// the program is still running in a background thread
// at this point.  attempting to call [self ...] or
// issue NSNotifications will result in a crash.
// use GCD to get run the following code on the main
// thread, thereby reloading the appropriate NSOutlineView
// data.
-(void)parserDidFinish
{
    DLog(@"parserDidFinish");
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // Classes selected in UI
        if([self->_comboObjectSelection.objectValueOfSelectedItem isEqualToString:C_ClassInterfaces_value])
        {
            [self loadABAPClassesWithSearchText:nil];
        }
        
        // Function Groups selected in UI
        if([self->_comboObjectSelection.objectValueOfSelectedItem isEqualToString:C_FunctionGroups_value])
        {
            // contained to handle refresh / reload requests
            [self loadABAPFUGRWithSearchText:nil];
        }
        
        // SE38 programs selected in UI
        if([self->_comboObjectSelection.objectValueOfSelectedItem isEqualToString:C_Programs_value])
        {
            // contained to handle refresh / reload requests
            [self loadABAPProgramsWithSearchText:nil];
        }

        
    });
}






#pragma mark - handle selection in the NSOutlineView
-(void)outlineViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger i = [_myOutlineView selectedRow];
    if(i>=0)
    {
        // only single row selections are permitted.
        // M_ABAPClass selection
        // selecting a class will show the class properties tab.
        // selecting a method will show a method tab.
        // selecting an attribute will show the attributes tab.
        // all tabs will be loaded
        // M_ABAPFugr selection
        // selecting a FUGR will show the FGRP properties tab.
        // selecting a function-module will show the FM source tab.
        // selecting an include will show an include tab.
        // FUGR properties will be loaded no matter what
        // M_ABAPPrograms
        // selecting a program will show the program source tab.
        // selecting a text will show the program texts tab.
        
        _selectedNode = [_myOutlineView itemAtRow:i];
        // DLog(@"%@",[[_myOutlineView parentForItem:_selectedNode]representedObject]);
        DLog(@"selected object isa: %@",[_selectedNode description]);
        // DLog(@"selected object->_representedObject: %@",_selectedNode.representedObject);
        
        // send the selected node to the target controller
        NSDictionary *dictRO = [[NSDictionary alloc]initWithObjectsAndKeys:_selectedNode.representedObject,C_selectedNode, nil];
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:kABAPTreeNodeSelected object:nil userInfo:dictRO];
    
    }
}



#pragma mark - handle deletion in the NSOutlineView(?)
- (IBAction)segmentSelected:(NSSegmentedControl*)sc
{
    NSLog(@"segment %lu selected",sc.selectedSegment);
    switch (sc.selectedSegment)
    {
        case 0:
        {
            [self openSlinkee];
        }
            break;
            
        case 1:
        {
            
        }
            break;
            
        default:
            break;
    }
}
@end
