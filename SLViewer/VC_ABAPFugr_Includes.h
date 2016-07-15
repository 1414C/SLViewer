//
//  VC_ABAPFugr_Includes.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-20.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugrIncl.h"
#import "M_ABAPFugr.h"
#import "WC_ABAPFugrIncludes_Modal.h"

@interface VC_ABAPFugr_Includes : NSViewController


@property (strong) IBOutlet NSTextField *txt_area;

@property (nonatomic,strong) NSSet *fugrIncludes;
@property (nonatomic,strong) NSArray *arrayIncludes;
@property (strong) IBOutlet NSTableView *includeTableView;
@property (strong,nonatomic) WC_ABAPFugrIncludes_Modal *wcIncl;

// method to deal with double-click on table row
-(void)didDoubleClick:(id)nid;

// method to deal with
// -(void)didSelectFunctionModule:(M_ABAPFugrFM*)fm;

@end
