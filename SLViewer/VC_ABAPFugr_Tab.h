//
//  VC_ABAPFugr_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-16.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ABAPTreeNode.h" 
#import "M_ABAPFugr.h"
#import "ABAPBOOLTransformer.h"
#import "ABAPCodeFormatUtil.h"

@interface VC_ABAPFugr_Tab : NSViewController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong) IBOutlet NSTextField *txt_area;
@property (strong) IBOutlet NSTextField *txt_areat;
@property (strong) IBOutlet NSTextField *txt_name;
@property (strong) IBOutlet NSTextField *txt_cnam;
@property (strong) IBOutlet NSDatePicker *dp_cdat;
@property (strong) IBOutlet NSTextField *txt_unam;
@property (strong) IBOutlet NSDatePicker *dp_udat;
@property (strong) IBOutlet NSButton *chkboxFixpt;

@property (strong,nonatomic) ABAPTreeNode *treeNode;
@property (strong,nonatomic) M_ABAPFugr *abapFugr;

@property (strong) IBOutlet NSTextView *txtview_mainprogram;





//@property (nonatomic, retain) NSString * appl;
//@property (nonatomic, retain) NSString * area;
//@property (nonatomic, retain) NSString * areat;
//@property (nonatomic, retain) NSString * cdat;
//@property (nonatomic, retain) NSString * cnam;
//@property (nonatomic, retain) NSString * dbapl;
//@property (nonatomic, retain) NSString * dbna;
//@property (nonatomic, retain) NSString * fixpt;
//@property (nonatomic, retain) NSString * fugr_uuid;
//@property (nonatomic, retain) NSString * idate;
//@property (nonatomic, retain) NSString * itime;
//@property (nonatomic, retain) NSString * ldbname;
//@property (nonatomic, retain) NSString * name;
//@property (nonatomic, retain) NSString * rload;
//@property (nonatomic, retain) NSString * rmand;
//@property (nonatomic, retain) NSString * sdate;
//@property (nonatomic, retain) NSString * source;
//@property (nonatomic, retain) NSString * stime;
//@property (nonatomic, retain) NSString * subc;
//@property (nonatomic, retain) NSString * uccheck;
//@property (nonatomic, retain) NSString * udat;
//@property (nonatomic, retain) NSString * unam;
//@property (nonatomic, retain) NSString * varcl;
//@property (nonatomic, retain) NSString * vern;
//@property (nonatomic, retain) NSSet *fg_fgincl;
//@property (nonatomic, retain) NSSet *fg_fm;
@end

