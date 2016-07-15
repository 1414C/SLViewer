//
//  VC_ABAPClassMethod_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WC_ABAPMethod_Modal.h"
//#import "WC_PopupWindowContainer.h"

@interface VC_ABAPClassMethod_Tab : NSViewController <NSTableViewDelegate>
{
    
}

@property (strong) IBOutlet NSTextField *txt_clsname;

@property (nonatomic,strong) NSSet *classMethods;
@property (nonatomic,strong) NSArray *arrayClassMethods;
@property (strong) IBOutlet NSTableView *methodTableView;

@property (strong,nonatomic) WC_ABAPMethod_Modal *wcmm;

@property (strong) IBOutlet NSButton *btnTest;
- (IBAction)btnTestPressed:(id)sender;


// method to deal with double-click on table row
-(void)didDoubleClick:(id)nid;

// method to deal with method seletion via outline view
-(void)didSelectABAPClassMethod:(M_ABAPClassMethod*)acm;

@end
