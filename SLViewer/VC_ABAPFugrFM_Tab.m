//
//  VC_ABAPFugrFM_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-17.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

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
