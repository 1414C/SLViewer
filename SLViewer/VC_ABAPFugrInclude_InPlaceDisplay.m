//
//  VC_ABAPFugrInclude_InPlaceDisplay.m
//  SLViewer
//
//  Created by stephen macleod on 2015-05-04.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_ABAPFugrInclude_InPlaceDisplay.h"

@interface VC_ABAPFugrInclude_InPlaceDisplay ()

@end

@implementation VC_ABAPFugrInclude_InPlaceDisplay

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.

    _txtViewInclSource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_fgTopInclude include_source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
        
#pragma mark - 10.11 update
        [_txtViewInclSource insertText:as replacementRange:[_txtViewInclSource selectedRange]];
        // [_txtViewInclSource insertText:as];
#pragma mark - 10.11 update end
    }
    
    [[_txtViewInclSource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    _txtViewInclSource.editable = NO;
    [_txtViewInclSource scrollToBeginningOfDocument:self];
    
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Function Group Include  %@",[_fgTopInclude name]]];
}

@end
