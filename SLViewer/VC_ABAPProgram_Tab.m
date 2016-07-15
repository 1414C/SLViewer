//
//  VC_ABAPProgram_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-29.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_ABAPProgram_Tab.h"

@interface VC_ABAPProgram_Tab ()

@end

@implementation VC_ABAPProgram_Tab

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];
    
    _txtName.stringValue = [_abapProgram name];
    if([_abapProgram cnam])
    {
        _txtCnam.stringValue = [_abapProgram cnam];
    }
    else
    {
        _txtCnam.stringValue = @"UNKNOWN";
    }

    if([_abapProgram unam])
    {
        _txtUnam.stringValue = [_abapProgram unam];
    }
    
    //_txtViewSource.string = [_abapProgram source];

    _txtViewSource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_abapProgram source]componentsSeparatedByString:@"\n"];
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
    
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Program  %@",[_abapProgram name]]];
}

@end
