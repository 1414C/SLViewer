//
//  VC_ABAPProgram_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-29.
//
///////////////////////////////////////////////////////////////////////////////////////
// The MIT License (MIT) - see LICENSE.md
//
// Copyright (c) 2016 Steve MacLeod
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//////////////////////////////////////////////////////////////////////////////////////

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
