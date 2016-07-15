//
//  VC_ABAPClassAttributes_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

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
