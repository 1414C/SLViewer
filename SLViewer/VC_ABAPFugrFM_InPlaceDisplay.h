//
//  VC_ABAPFugrFM_InPlaceDisplay.h
//  SLViewer
//
//  Created by stephen macleod on 2015-05-04.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugrFM.h"
#import "ABAPCodeFormatUtil.h"

@interface VC_ABAPFugrFM_InPlaceDisplay : NSViewController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong,nonatomic) M_ABAPFugrFM *functionModule;
@property (strong) IBOutlet NSTextField *txtName;

@property (strong) IBOutlet NSTextView *txtViewFMSource;

@property (strong) IBOutlet NSArrayController *fmParamArrayController;
@property (strong) NSArray *arrayFMParameters;
@property (strong) IBOutlet NSTableView *parameterTableView;

@end
