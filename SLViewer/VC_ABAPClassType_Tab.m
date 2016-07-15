//
//  VC_ABAPClassType_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-16.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_ABAPClassType_Tab.h"
#import "M_ABAPClass.h"

@interface VC_ABAPClassType_Tab ()

@end

@implementation VC_ABAPClassType_Tab

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    
    if(_arrayClassTypes != nil)
    {
        M_ABAPClassType *atyp = _arrayClassTypes[0];
        _txt_clsname.stringValue = (NSString*)[[atyp clstyp_cls]clsname];
    }
    
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];
}


-(void)viewWillAppear
{
    if(_txt_clsname.stringValue != nil)
    {
        NSWindow *window = [[NSApplication sharedApplication]mainWindow];
        [window setTitle:[NSString stringWithFormat:@"Class  %@ - Types",_txt_clsname.stringValue]];
    }
}


// override - this gets called after init, but before the view is rendered
// in the NSTabViewItem
-(void)setClassTypes:(NSSet *)classTypes
{
    _classTypes = [[NSSet alloc]initWithSet:classTypes];
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayClassTypes = [[NSArray alloc]initWithArray:[_classTypes sortedArrayUsingDescriptors:arraySD]];
}


@end
