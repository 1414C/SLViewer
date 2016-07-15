//
//  WC_ABAPFugrFM_Modal.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-18.
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

#import "WC_ABAPFugrFM_Modal.h"
#import "M_ABAPFugrFMParameter.h"


@interface WC_ABAPFugrFM_Modal ()

@end

@implementation WC_ABAPFugrFM_Modal

-(instancetype)initWithDict:(NSDictionary*)d
{
    self = [super initWithWindowNibName:@"WC_ABAPFugrFM_Modal"];
    
    _functionModule = [d valueForKey:@"abapFunctionModule"];
    DLog(@"%@",_functionModule);
    
    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES], nil];
    _arrayFMParameters = [[NSArray alloc]initWithArray:[[_functionModule fm_fmp] sortedArrayUsingDescriptors:arraySD]];
    
    return self;
}



- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set the method name and the method body
    _txt_name.stringValue = [_functionModule name];
    _txt_name.editable = NO;
    
    _txtview_fmSource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_functionModule fm_source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
        
#pragma mark - 10.11 update
        //[_txtview_fmSource insertText:as];
        [_txtview_fmSource insertText:as replacementRange:[_txtview_fmSource selectedRange]];
#pragma mark - 10.00 udpate end
    }
    
    [[_txtview_fmSource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    
    _txtview_fmSource.editable = NO;
    [_txtview_fmSource scrollToBeginningOfDocument:self];
    [self.window setTitle:[NSString stringWithFormat:@"Function Module  %@",[_functionModule name]]];
}




@end
