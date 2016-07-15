//
//  tabVC.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>


static NSString *const kClassPropertiesTab = @"classPropertiesTab";
static NSString *const kClassMethodsTab = @"classMethodsTab";
static NSString *const kClassEventsTab = @"classEventsTab";
static NSString *const kClassAttributesTab = @"classAttributesTab";
static NSString *const kClassTypesTab = @"classTypesTab";
static NSString *const kClassMethodIPTab = @"classMethodIPTab";

static NSString *const kFugrPropertiesTab = @"fugrPropertiesTab";
static NSString *const kFugrFunctionModulesTab = @"fugrFunctionModulesTab";
static NSString *const kFugrTopIncludeTab = @"fugrFugrTopIncludeTab";
static NSString *const kFugrIncludesTab = @"fugrIncludesTab";
static NSString *const kFugrFMIPTab = @"fugrFMIPTab";
static NSString *const kFugrInclIPTab = @"fugrInclIPTab";

static NSString *const kProgTab = @"progTab";

@interface tabVC : NSTabViewController


@end
