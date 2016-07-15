//
//  VC_ABAPClass_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ABAPTreeNode.h"
#import "M_ABAPClass.h"

@interface VC_ABAPClass_Tab : NSViewController

@property (nonatomic,strong) ABAPTreeNode *treeNode;
@property (strong,nonatomic) M_ABAPClass *abapClass;


@property (strong) IBOutlet NSTextField *txt_clsname;
@property (strong) IBOutlet NSTextField *txt_refclsname;
@property (strong) IBOutlet NSTextField *txt_descript;
@property (strong) IBOutlet NSTextField *txt_author;
@property (strong) IBOutlet NSTextField *txt_changedby;
@property (strong) IBOutlet NSTextField *txt_rel;
@property (strong) IBOutlet NSTextField *txt_langu;
@property (strong) IBOutlet NSTextField *txt_version;
@property (strong) IBOutlet NSButton *chkboxFixpt;
@property (strong) IBOutlet NSButton *chkbox_clsfinal;
@property (strong) IBOutlet NSButton *chkbox_unicode;
@property (strong) IBOutlet NSDatePicker *dp_createdon;
@property (strong) IBOutlet NSDatePicker *dp_changedon;

@end
