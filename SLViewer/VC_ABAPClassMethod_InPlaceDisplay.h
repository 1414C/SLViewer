//
//  VC_ABAPClassMethod_InPlaceDisplay.h
//  SLViewer
//
//  Created by stephen macleod on 2015-05-04.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPClassMethod.h"
#import "ABAPCodeFormatUtil.h"

@interface VC_ABAPClassMethod_InPlaceDisplay : NSViewController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}


@property (strong,nonatomic) M_ABAPClassMethod *abapClassMethod;
@property (strong) IBOutlet NSArrayController *mtdParamArrayController;
@property (strong) NSArray *arrayMethodParameters;
@property (strong) IBOutlet NSTableView *parameterTableView;
@property (strong) IBOutlet NSTextView *txtViewSource;

@end
