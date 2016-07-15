//
//  VC_ABAPFugr_Includes.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-20.
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

#import "VC_ABAPFugr_Includes.h"

@interface VC_ABAPFugr_Includes ()

@end

@implementation VC_ABAPFugr_Includes

-(void)awakeFromNib
{
    [_includeTableView setDoubleAction:@selector(didDoubleClick:)];
    [_includeTableView setTarget:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];
    
    if(_arrayIncludes != nil && [_arrayIncludes count] >0)
    {
        M_ABAPFugrIncl *fgInclude = _arrayIncludes[0];
        M_ABAPFugr *fGroup = [fgInclude fgincl_fg];
        _txt_area.stringValue = (NSString*)[fGroup area];
        [_txt_area setEditable:NO];
    }
    
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Function Group  %@ - Includes",_txt_area.stringValue]];
}


-(void)viewWillAppear
{
    if(_txt_area.stringValue != nil)
    {
        NSWindow *window = [[NSApplication sharedApplication]mainWindow];
        [window setTitle:[NSString stringWithFormat:@"Function Group  %@ - Includes",_txt_area.stringValue]];
    }
}


// override - this gets called after init, but before the view is rendered
// in the NSTabViewItem
-(void)setFugrIncludes:(NSSet *)includes
{
    _fugrIncludes = [[NSSet alloc]initWithSet:includes];
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES], nil];
    _arrayIncludes = [[NSArray alloc]initWithArray:[_fugrIncludes sortedArrayUsingDescriptors:arraySD]];
}


-(void)didDoubleClick:(id)nid
{
    DLog(@"double-click detected:%@",nid);
    DLog(@"%ld",(long)_includeTableView.selectedRow);
    NSDictionary *d = [[NSDictionary alloc]initWithObjectsAndKeys:_arrayIncludes[_includeTableView.selectedRow],@"fugrInclude", nil];
    _wcIncl = [[WC_ABAPFugrIncludes_Modal alloc]initWithDict:d];
    [_wcIncl showWindow:nil];
}

@end
