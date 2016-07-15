//
//  VC_ABAPClassEvent_Tab.m
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

#import "VC_ABAPClassEvent_Tab.h"
#import "AppDelegate.h"

@interface VC_ABAPClassEvent_Tab ()

@end

@implementation VC_ABAPClassEvent_Tab

-(void)awakeFromNib
{
    [_eventTableView setDoubleAction:@selector(didDoubleClick:)];
    [_eventTableView setTarget:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];

    if(_arrayClassEvents != nil && [_arrayClassEvents count] >0)
    {
        M_ABAPClassEvent *evt = _arrayClassEvents[0];
        _txt_clsname.stringValue = (NSString*)[evt clsname];
        [_txt_clsname setEditable:NO];
        DLog(@"%@",[evt clsname]);
    }
    
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Class  %@ - Events",_txt_clsname.stringValue]];
}


-(void)viewWillAppear
{
    if(_txt_clsname.stringValue != nil)
    {
        NSWindow *window = [[NSApplication sharedApplication]mainWindow];
        [window setTitle:[NSString stringWithFormat:@"Class  %@ - Events",_txt_clsname.stringValue]];
    }
}


// override
-(void)setClassEvents:(NSSet *)classEvents
{
    _classEvents = [[NSSet alloc]initWithSet:classEvents];
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayClassEvents = [[NSArray alloc]initWithArray:[_classEvents sortedArrayUsingDescriptors:arraySD]];
}



-(void)didDoubleClick:(id)nid
{
    DLog(@"double-click detected:%@",nid);
    DLog(@"%ld",(long)_eventTableView.selectedRow);
    NSDictionary *d = [[NSDictionary alloc]initWithObjectsAndKeys:_arrayClassEvents[_eventTableView.selectedRow],@"abapClassEvent", nil];
    _wcem = [[WC_ABAPEvent_Modal alloc]initWithDict:d];
    [_wcem showWindow:nil];
    
    //    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //    [nc postNotificationName:kABAPShowMethodModal object:nil userInfo:d];
    
    //NSDictionary *dictTest = [[NSDictionary alloc]initWithObjectsAndKeys:@"Test String",@"testStringKey", nil];
}
@end
