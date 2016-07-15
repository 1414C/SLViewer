//
//  VC_ABAPClassAttributes_Tab.m
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

#import "VC_ABAPClassAttributes_Tab.h"

@interface VC_ABAPClassAttributes_Tab ()

@end

@implementation VC_ABAPClassAttributes_Tab

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    
    if(_arrayClassAttributes != nil)
    {
        M_ABAPClassAttribute *attr = _arrayClassAttributes[0];
        _txt_clsname.stringValue = (NSString*)[attr clsname];
        DLog(@"%@",[attr clsname]);
    }
    
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];
}


-(void)viewWillAppear
{
    if(_txt_clsname.stringValue != nil)
    {
        NSWindow *window = [[NSApplication sharedApplication]mainWindow];
        [window setTitle:[NSString stringWithFormat:@"Class  %@ - Attributes",_txt_clsname.stringValue]];
    }
}


// override - this gets called after init, but before the view is rendered
// in the NSTabViewItem
-(void)setClassAttributes:(NSSet *)classAttributes
{
    _classAttributes = [[NSSet alloc]initWithSet:classAttributes];
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayClassAttributes = [[NSArray alloc]initWithArray:[_classAttributes sortedArrayUsingDescriptors:arraySD]];
}

@end
