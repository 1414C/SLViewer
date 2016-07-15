//
//  ViewController.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-01.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ConstantsAndEnums.h"
#import "ABAPClassXMLParser.h"
#import "ABAPDetailController.h"
#import "ABAPTreeNode.h"
#import "ABAPOutlineContent.h"


@interface ViewController : NSViewController <ABAPXMLClassParserDelegate, NSOutlineViewDelegate, NSComboBoxDelegate>

{
     NSData *fileData;
    int _activeSAPABAPType;
    
    NSMutableArray *_classArray;
    NSMutableArray *_fugrArray;
    NSMutableArray *_progArray;
    
    // NSSortDescriptor *_childSD;
    NSSortDescriptor *_objectSD;
    
    ABAPTreeNode *_selectedNode;
    
    NSMutableArray *_arrayData;
}

@property (nonatomic,strong) id dataModel;
@property (strong) IBOutlet NSOutlineView *myOutlineView;
@property (strong) IBOutlet NSTreeController *myTreeController;
@property (strong) IBOutlet NSComboBox *comboObjectSelection;
@property (strong) IBOutlet NSComboBox *comboSortSelection;

// segmented control
@property (strong) IBOutlet NSView *fillerSegmentView;
@property (strong) IBOutlet NSTextField *txtImportLog;

@property (strong) IBOutlet NSSegmentedControl *addRemoveSeg;
- (IBAction)segmentSelected:(NSSegmentedControl*)sc;

@property (strong) IBOutlet NSSearchField *searchField;
- (IBAction)updateFilter:(id)sender;

-(void)openSlinkee;


@end

