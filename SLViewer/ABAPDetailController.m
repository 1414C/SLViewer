//
//  ABAPDetailController.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-08.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
//
// simply used as a container VC for the NSTabViewController

#import "ABAPDetailController.h"
#import "ConstantsAndEnums.h"



@interface ABAPDetailController ()

@end

@implementation ABAPDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear
{
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor controlColor]CGColor]];
}


//-(void)classMethodSelectionNotificationReceived:(NSNotification*)notification
//{
//    DLog("ABAPDetailController received signal: %@",notification);
//    _dictUserInfo = [[NSDictionary alloc]initWithDictionary:notification.userInfo];
//    [self performSegueWithIdentifier:kABAPShowMethodModal sender:self];
//}
//
//// send the color to the test viewcontroller
//-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender
//{
//    // get a reference to the second view controller
//    if([[segue identifier]isEqualToString:kABAPShowMethodModal])
//    {
////        VC_ABAPMethod_Modal *abapMethodModalController = segue.destinationController;
////        abapMethodModalController.representedObject = _dictUserInfo;
//    }
//}

@end
