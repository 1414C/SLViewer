//
//  WC_ABAPFugrFM_Modal.h
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

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugrFM.h"
#import "ABAPCodeFormatUtil.h"

@interface WC_ABAPFugrFM_Modal : NSWindowController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong,nonatomic) M_ABAPFugrFM *functionModule;
@property (strong) IBOutlet NSTextField *txt_name;

@property (strong) IBOutlet NSTextView *txtview_fmSource;

@property (strong) IBOutlet NSArrayController *fmParamArrayController;
@property (strong) NSArray *arrayFMParameters;
@property (strong) IBOutlet NSTableView *parameterTableView;

-(instancetype)initWithDict:(NSDictionary*)d;

@end
