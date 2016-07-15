//
//  M_ABAPClassMethodRedef.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-30.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClass;

@interface M_ABAPClassMethodRedef : NSManagedObject

@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * refclsname;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * mtdname;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) M_ABAPClass *clsmtdrdef_cls;

@end
