//
//  ABAPDetailController.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-08.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ConstantsAndEnums.h"
#import "ABAPTreeNode.h"
#import "tabVC.h"

@interface ABAPDetailController : NSViewController

{
    NSDictionary *_dictUserInfo;
}

@property (nonatomic,strong) tabVC *tabViewController;


@end
