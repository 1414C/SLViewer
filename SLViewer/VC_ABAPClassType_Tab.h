//
//  VC_ABAPClassType_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-16.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPClassType.h"

@interface VC_ABAPClassType_Tab : NSViewController

@property (strong) IBOutlet NSTextField *txt_clsname;

@property (nonatomic,strong) NSSet *classTypes;
@property (nonatomic,strong) NSArray *arrayClassTypes;
@property (strong) IBOutlet NSTableView *typeTableView;

@end
