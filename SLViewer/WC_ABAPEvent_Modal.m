//
//  WC_ABAPEvent_Modal.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-13.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "WC_ABAPEvent_Modal.h"

@interface WC_ABAPEvent_Modal ()

@end

@implementation WC_ABAPEvent_Modal


-(instancetype)initWithDict:(NSDictionary*)d
{
    self = [super initWithWindowNibName:@"WC_ABAPEvent_Modal"];
    
    _abapClassEvent = [d valueForKey:@"abapClassEvent"];

    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayEventParameters = [[NSArray alloc]initWithArray:[[_abapClassEvent  clsevt_clsevtparam] sortedArrayUsingDescriptors:arraySD]];
    for(M_ABAPClassEventParameter *a in _arrayEventParameters)
    {
        DLog(@"%@",a.sconame);
    }
    
    return self;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set the method name and the method body
    _txt_cmpname.stringValue = [_abapClassEvent cmpname];
    _txt_cmpname.editable = NO;
//    _txtview_source.string = [_abapClassEvent sourcecode];
//    _txtview_source.editable = NO;
    if([[_abapClassEvent evtdecltyp] isEqualToString:@"1"])
    {
        [self.window setTitle:[NSString stringWithFormat:@"Event  %@=>%@",[_abapClassEvent clsname],[_abapClassEvent cmpname]]];
    }
    else
    {
        [self.window setTitle:[NSString stringWithFormat:@"Event  %@->%@",[_abapClassEvent clsname],[_abapClassEvent cmpname]]];
    }
}



@end
