//
//  VC_ABAPClassMethod_InPlaceDisplay.m
//  SLViewer
//
//  Created by stephen macleod on 2015-05-04.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_ABAPClassMethod_InPlaceDisplay.h"

@interface VC_ABAPClassMethod_InPlaceDisplay ()

@end

@implementation VC_ABAPClassMethod_InPlaceDisplay


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}

-(void)viewWillAppear
{
    if(_abapClassMethod != nil)
    {
        // set the window title
        NSWindow *window = [[NSApplication sharedApplication]mainWindow];
        if([[_abapClassMethod mtddecltyp] isEqualToString:@"1"])
        {
            [window setTitle:[NSString stringWithFormat:@"Method  %@=>%@",[_abapClassMethod clsname],[_abapClassMethod cmpname]]];
        }
        else
        {
            [window setTitle:[NSString stringWithFormat:@"Method  %@->%@",[_abapClassMethod clsname],[_abapClassMethod cmpname]]];
        }
    
    
        // set the source code
        _txtViewSource.editable = YES;
        _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
        
        // create an array object for each source line
        NSArray *arraySourceLines = [[_abapClassMethod sourcecode]componentsSeparatedByString:@"\n"];
        for(NSMutableString *s in arraySourceLines)
        {
            // add the /n back to the line
            NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
            NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
#pragma mark - 10.11 update
            [_txtViewSource insertText:as replacementRange:[_txtViewSource selectedRange]];
            // [_txtViewSource insertText:as];
#pragma mark - 10.11 update end
        }
        
        [[_txtViewSource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
        _txtViewSource.editable = NO;
        [_txtViewSource scrollToBeginningOfDocument:self];
        
    }
}



@end
