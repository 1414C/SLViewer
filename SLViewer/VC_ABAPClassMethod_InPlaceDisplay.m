//
//  VC_ABAPClassMethod_InPlaceDisplay.m
//  SLViewer
//
//  Created by stephen macleod on 2015-05-04.
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
