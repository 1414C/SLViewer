//
//  WC_ABAPEvent_Modal.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-13.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPClassEvent.h"
#import "M_ABAPClassEventParameter.h"

@interface WC_ABAPEvent_Modal : NSWindowController

@property (strong,nonatomic) M_ABAPClassEvent *abapClassEvent;
@property (strong) IBOutlet NSTextField *txt_cmpname;

@property (strong) IBOutlet NSTextView *txtview_source;

@property (strong) IBOutlet NSArrayController *evtParamArrayController;
@property (strong) NSArray *arrayEventParameters;
@property (strong) IBOutlet NSTableView *parameterTableView;

-(instancetype)initWithDict:(NSDictionary*)d;

@end
