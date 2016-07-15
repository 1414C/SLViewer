//
//  VC_ABAPClass_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
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
#import "ABAPTreeNode.h"
#import "M_ABAPClass.h"

@interface VC_ABAPClass_Tab : NSViewController

@property (nonatomic,strong) ABAPTreeNode *treeNode;
@property (strong,nonatomic) M_ABAPClass *abapClass;


@property (strong) IBOutlet NSTextField *txt_clsname;
@property (strong) IBOutlet NSTextField *txt_refclsname;
@property (strong) IBOutlet NSTextField *txt_descript;
@property (strong) IBOutlet NSTextField *txt_author;
@property (strong) IBOutlet NSTextField *txt_changedby;
@property (strong) IBOutlet NSTextField *txt_rel;
@property (strong) IBOutlet NSTextField *txt_langu;
@property (strong) IBOutlet NSTextField *txt_version;
@property (strong) IBOutlet NSButton *chkboxFixpt;
@property (strong) IBOutlet NSButton *chkbox_clsfinal;
@property (strong) IBOutlet NSButton *chkbox_unicode;
@property (strong) IBOutlet NSDatePicker *dp_createdon;
@property (strong) IBOutlet NSDatePicker *dp_changedon;

@end
