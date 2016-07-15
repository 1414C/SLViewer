//
//  WC_ABAPMethod_Modal.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-13.
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

#import "WC_ABAPMethod_Modal.h"


@interface WC_ABAPMethod_Modal ()

@end

@implementation WC_ABAPMethod_Modal


-(instancetype)initWithDict:(NSDictionary*)d
{
    self = [super initWithWindowNibName:@"WC_ABAPMethod_Modal"];
    
    _abapClassMethod = [d valueForKey:@"abapClassMethod"];

    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayMethodParameters = [[NSArray alloc]initWithArray:[[_abapClassMethod clsmtd_clsmtdparam] sortedArrayUsingDescriptors:arraySD]];
    for(M_ABAPClassMethodParameter *a in _arrayMethodParameters)
    {
        DLog(@"%@",a.sconame);
    }
    
    return self;
}

-(instancetype)initWithABAPClassMethod:(M_ABAPClassMethod *)acm
{
    self = [super initWithWindowNibName:@"WC_ABAPMethod_Modal"];
    
    _abapClassMethod = acm;
    
    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayMethodParameters = [[NSArray alloc]initWithArray:[[_abapClassMethod clsmtd_clsmtdparam] sortedArrayUsingDescriptors:arraySD]];
    for(M_ABAPClassMethodParameter *a in _arrayMethodParameters)
    {
        DLog(@"%@",a.sconame);
    }
    
    return self;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set the method name and the method body
    _txt_cmpname.stringValue = [_abapClassMethod cmpname];
    _txt_cmpname.editable = NO;
    
    //_txtview_source.string = [_abapClassMethod sourcecode];
    
    _txtview_source.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_abapClassMethod sourcecode]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
#pragma mark - 10.11 update
        [_txtview_source insertText:as replacementRange:[_txtview_source selectedRange]];
        // [_txtview_source insertText:as];
#pragma mark - 10.11 update end
    }
    
    [[_txtview_source textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    _txtview_source.editable = NO;
    [_txtview_source scrollToBeginningOfDocument:self];
    
    
    
    if([[_abapClassMethod mtddecltyp] isEqualToString:@"1"])
    {
        [self.window setTitle:[NSString stringWithFormat:@"Method  %@=>%@",[_abapClassMethod clsname],[_abapClassMethod cmpname]]];
    }
    else
    {
        [self.window setTitle:[NSString stringWithFormat:@"Method  %@->%@",[_abapClassMethod clsname],[_abapClassMethod cmpname]]];
    }
}



@end
