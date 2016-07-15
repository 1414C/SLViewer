//
//  M_ABAPClassMethodException.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClassMethod;

@interface M_ABAPClassMethodException : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * changedon;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * createdon;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * mtd_UUID;
@property (nonatomic, retain) NSString * mtdtype;
@property (nonatomic, retain) NSString * sconame;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) M_ABAPClassMethod *clsmtdex_mtd;

@end
