//
//  VC_ABAPFugrFM_InPlaceDisplay.m
//  SLViewer
//
//  Created by stephen macleod on 2015-05-04.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_ABAPFugrFM_InPlaceDisplay.h"

@interface VC_ABAPFugrFM_InPlaceDisplay ()

@end

@implementation VC_ABAPFugrFM_InPlaceDisplay

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}


-(void)viewWillAppear
{
    // set the method name and the method body

    _txtViewFMSource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_functionModule fm_source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
        [_txtViewFMSource insertText:as replacementRange:[_txtViewFMSource selectedRange]];
       // [_txtViewFMSource insertText:as];
    }
    
    [[_txtViewFMSource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    
    _txtViewFMSource.editable = NO;
    [_txtViewFMSource scrollToBeginningOfDocument:self];
    
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Function Module  %@",[_functionModule name]]];
}

@end
