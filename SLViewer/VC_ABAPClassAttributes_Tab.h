//
//  VC_ABAPClassAttributes_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPClassAttribute.h"

@interface VC_ABAPClassAttributes_Tab : NSViewController


@property (strong) IBOutlet NSTextField *txt_clsname;

@property (nonatomic,strong) NSSet *classAttributes;
@property (nonatomic,strong) NSArray *arrayClassAttributes;
@property (strong) IBOutlet NSTableView *attributeTableView;

@end
