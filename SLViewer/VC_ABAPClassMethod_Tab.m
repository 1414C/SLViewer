//
//  VC_ABAPClassMethod_Tab.m
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
//------------------------------------------------------------------------------------
// _arrayClassMethods is used in a binding
// between the NSArrayController and the
// tableView in order to display the
// class methods.

#import "VC_ABAPClassMethod_Tab.h"
#import "ConstantsAndEnums.h"
#import "M_ABAPClassMethod.h"
#import "WC_ABAPMethod_Modal.h"
//#import "WC_PopupWindowContainer.h"


@interface VC_ABAPClassMethod_Tab ()

@end

@implementation VC_ABAPClassMethod_Tab

-(void)awakeFromNib
{
    [_methodTableView setDoubleAction:@selector(didDoubleClick:)];
    [_methodTableView setTarget:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    
    if(_arrayClassMethods != nil)
    {
        M_ABAPClassMethod *mtd = _arrayClassMethods[0];
        _txt_clsname.stringValue = (NSString*)[mtd clsname];
        DLog(@"%@",[mtd clsname]);
    }
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(tableViewSelectionDidChange:) name:NSTableViewSelectionDidChangeNotification object:nil];
    
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];
    
    NSWindow *window = [[NSApplication sharedApplication]mainWindow];
    [window setTitle:[NSString stringWithFormat:@"Class  %@ - Methods",_txt_clsname.stringValue]];
    
}

-(void)viewWillAppear
{
    if(_txt_clsname.stringValue != nil)
    {
        NSWindow *window = [[NSApplication sharedApplication]mainWindow];
        [window setTitle:[NSString stringWithFormat:@"Class  %@ - Methods",_txt_clsname.stringValue]];
    }
}

// override - this gets called after init, but before the view is rendered
// in the NSTabViewItem
-(void)setClassMethods:(NSSet *)classMethods
{
    _classMethods = [[NSSet alloc]initWithSet:classMethods];
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayClassMethods = [[NSArray alloc]initWithArray:[_classMethods sortedArrayUsingDescriptors:arraySD]];
}


- (IBAction)btnTestPressed:(id)sender
{
//    if(_classMethods != nil)
//    {
//        NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
//        _arrayClassMethods = [[NSArray alloc]initWithArray:[_classMethods sortedArrayUsingDescriptors:arraySD]];
//    }
    NSDictionary *d = [[NSDictionary alloc]initWithObjectsAndKeys:_arrayClassMethods,@"arrayClassMethods", nil];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:kABAPShowMethodModal object:nil userInfo:d];
}

// when the selection notification is received, read
// _arrayClassMethods, and then post a notification.
// the notification will be received by the ViewController
// that is holding the NSContainerView (embed segue thing).
// the observing viewcontroller will then trigger the appropriate
// 'show' segue to launch the modal style window containing
// the method interface and source code.
-(void)tableViewSelectionDidChange:(NSNotification *)notification
{
//    DLog(@"%ld",(long)_methodTableView.selectedRow);
//    NSDictionary *d = [[NSDictionary alloc]initWithObjectsAndKeys:_arrayClassMethods[_methodTableView.selectedRow],@"arrayClassMethod", nil];
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    [nc postNotificationName:kABAPShowMethodModal object:nil userInfo:d];
}

-(void)didDoubleClick:(id)nid
{
    DLog(@"double-click detected:%@",nid);
    DLog(@"%ld",(long)_methodTableView.selectedRow);
    NSDictionary *d = [[NSDictionary alloc]initWithObjectsAndKeys:_arrayClassMethods[_methodTableView.selectedRow],@"abapClassMethod", nil];
    _wcmm = [[WC_ABAPMethod_Modal alloc]initWithDict:d];
    [_wcmm showWindow:nil];
}


-(void)didSelectABAPClassMethod:(M_ABAPClassMethod *)acm
{
    if(_wcmm)
    {
        [_wcmm close];
    }
    _wcmm = nil;
    _wcmm = [[WC_ABAPMethod_Modal alloc]initWithABAPClassMethod:acm];
    [_wcmm showWindow:nil];
}


// cleanup the observer
-(void)dealloc
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:NSTableViewSelectionDidChangeNotification object:nil];
}
     @end
