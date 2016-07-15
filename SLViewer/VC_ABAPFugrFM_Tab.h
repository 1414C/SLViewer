//
//  VC_ABAPFugrFM_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-17.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugr.h"
#import "M_ABAPFugrFM.h"
#import "WC_ABAPFugrFM_Modal.h"

@interface VC_ABAPFugrFM_Tab : NSViewController

@property (strong) IBOutlet NSTextField *txt_area;

@property (nonatomic,strong) NSSet *fugrFunctionModules;
@property (nonatomic,strong) NSArray *arrayFunctionModules;
@property (strong) IBOutlet NSTableView *functionModuleTableView;
@property (strong,nonatomic) WC_ABAPFugrFM_Modal *wcfm;

// method to deal with double-click on table row
-(void)didDoubleClick:(id)nid;

// method to deal with fucntion module seletion via outline view
-(void)didSelectFunctionModule:(M_ABAPFugrFM*)fm;

@end
