//
//  VC_Default_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_Default_Tab.h"

@interface VC_Default_Tab ()

@end

@implementation VC_Default_Tab

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor orangeColor]CGColor]];
}

@end
