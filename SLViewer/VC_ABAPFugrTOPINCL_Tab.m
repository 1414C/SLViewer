//
//  VC_ABAPFugrTOPINCL_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-19.
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

#import "VC_ABAPFugrTOPINCL_Tab.h"

@interface VC_ABAPFugrTOPINCL_Tab ()

@end

@implementation VC_ABAPFugrTOPINCL_Tab


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
    
    _txtview_topsource.string = _fgTopInclude.include_source;
    
    
    _txtview_topsource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_fgTopInclude include_source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
        
        [_txtview_topsource insertText:as replacementRange:[_txtview_topsource selectedRange]];
        // [_txtview_topsource insertText:as];
    }
    
    [[_txtview_topsource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    _txtview_topsource.editable = NO;
    [_txtview_topsource scrollToBeginningOfDocument:self];
}

@end
