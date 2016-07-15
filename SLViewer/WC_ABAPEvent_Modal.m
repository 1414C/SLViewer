//
//  WC_ABAPEvent_Modal.m
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

#import "WC_ABAPEvent_Modal.h"

@interface WC_ABAPEvent_Modal ()

@end

@implementation WC_ABAPEvent_Modal


-(instancetype)initWithDict:(NSDictionary*)d
{
    self = [super initWithWindowNibName:@"WC_ABAPEvent_Modal"];
    
    _abapClassEvent = [d valueForKey:@"abapClassEvent"];

    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayEventParameters = [[NSArray alloc]initWithArray:[[_abapClassEvent  clsevt_clsevtparam] sortedArrayUsingDescriptors:arraySD]];
    for(M_ABAPClassEventParameter *a in _arrayEventParameters)
    {
        DLog(@"%@",a.sconame);
    }
    
    return self;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set the method name and the method body
    _txt_cmpname.stringValue = [_abapClassEvent cmpname];
    _txt_cmpname.editable = NO;
//    _txtview_source.string = [_abapClassEvent sourcecode];
//    _txtview_source.editable = NO;
    if([[_abapClassEvent evtdecltyp] isEqualToString:@"1"])
    {
        [self.window setTitle:[NSString stringWithFormat:@"Event  %@=>%@",[_abapClassEvent clsname],[_abapClassEvent cmpname]]];
    }
    else
    {
        [self.window setTitle:[NSString stringWithFormat:@"Event  %@->%@",[_abapClassEvent clsname],[_abapClassEvent cmpname]]];
    }
}



@end
