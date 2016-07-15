//
//  VC_ABAPClassEvent_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

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
