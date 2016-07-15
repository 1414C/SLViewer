//
//  VC_ABAPFugrFM_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-17.
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

#import "VC_ABAPFugrFM_Tab.h"
#import "WC_ABAPFugrFM_Modal.h"

@interface VC_ABAPFugrFM_Tab ()

@end

@implementation VC_ABAPFugrFM_Tab

-(void)awakeFromNib
{
    [_functionModuleTableView setDoubleAction:@selector(didDoubleClick:)];
    [_functionModuleTableView setTarget:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];
    
    if(_arrayFunctionModules != nil && [_arrayFunctionModules count] >0)
    {
        M_ABAPFugrFM *fM = _arrayFunctionModules[0];
        _txt_area.stringValue = (NSString*)[[fM fm_fg]area];
        [_txt_area setEditable:NO];
    }
    
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Function Group  %@ - Function Modules",_txt_area.stringValue]];
}


-(void)viewWillAppear
{
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Function Group  %@ - Function Modules",_txt_area.stringValue]];
}


// override
-(void)setFugrFunctionModules:(NSSet *)fugrFunctionModules
{
    _fugrFunctionModules = [[NSSet alloc]initWithSet:fugrFunctionModules];
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES], nil];
    _arrayFunctionModules = [[NSArray alloc]initWithArray:[_fugrFunctionModules sortedArrayUsingDescriptors:arraySD]];
}


-(void)didDoubleClick:(id)nid
{
    DLog(@"double-click detected:%@",nid);
    DLog(@"%ld",(long)_functionModuleTableView.selectedRow);
    NSDictionary *d = [[NSDictionary alloc]initWithObjectsAndKeys:_arrayFunctionModules[_functionModuleTableView.selectedRow],@"abapFunctionModule", nil];
    _wcfm = [[WC_ABAPFugrFM_Modal alloc]initWithDict:d];
    [_wcfm showWindow:nil];
}

-(void)didSelectFunctionModule:(M_ABAPFugrFM*)fm
{
    if(_wcfm)
    {
        [_wcfm close];
    }
    _wcfm = nil;
    NSDictionary *d = [[NSDictionary alloc]initWithObjectsAndKeys:fm,@"abapFunctionModule", nil];
    _wcfm = [[WC_ABAPFugrFM_Modal alloc]initWithDict:d];
    [_wcfm showWindow:nil];
}



@end
