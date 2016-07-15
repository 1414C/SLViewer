//
//  WC_ABAPFugrFM_Modal.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-18.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugrFM.h"
#import "ABAPCodeFormatUtil.h"

@interface WC_ABAPFugrFM_Modal : NSWindowController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong,nonatomic) M_ABAPFugrFM *functionModule;
@property (strong) IBOutlet NSTextField *txt_name;

@property (strong) IBOutlet NSTextView *txtview_fmSource;

@property (strong) IBOutlet NSArrayController *fmParamArrayController;
@property (strong) NSArray *arrayFMParameters;
@property (strong) IBOutlet NSTableView *parameterTableView;

-(instancetype)initWithDict:(NSDictionary*)d;

@end
