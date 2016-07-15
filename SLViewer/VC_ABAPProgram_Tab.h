//
//  VC_ABAPProgram_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-29.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPProgram.h"
#import "ABAPCodeFormatUtil.h"

@interface VC_ABAPProgram_Tab : NSViewController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong) M_ABAPProgram *abapProgram;

@property (strong) IBOutlet NSTextField *txtName;
@property (strong) IBOutlet NSTextField *txtCnam;
@property (strong) IBOutlet NSTextField *txtUnam;
@property (strong) IBOutlet NSDatePicker *dpCdat;
@property (strong) IBOutlet NSDatePicker *dpUdat;

@property (strong) IBOutlet NSTextView *txtViewSource;


@end
