//
//  VC_ABAPClassEvent_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPClassEvent.h"
#import "WC_ABAPEvent_Modal.h"


@interface VC_ABAPClassEvent_Tab : NSViewController

@property (strong) IBOutlet NSTextField *txt_clsname;

@property (nonatomic,strong) NSSet *classEvents;
@property (nonatomic,strong) NSArray *arrayClassEvents;
@property (strong) IBOutlet NSTableView *eventTableView;

@property (strong,nonatomic) WC_ABAPEvent_Modal *wcem;


// method to deal with double-click on table row
-(void)didDoubleClick:(id)nid;



@end
