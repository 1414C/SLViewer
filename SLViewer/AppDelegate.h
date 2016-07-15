//
//  AppDelegate.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-01.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//  Updated July 6, 2016
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction)openSlinkee:(id)sender;
-(IBAction)purgeDB:(id)sender;

@end

