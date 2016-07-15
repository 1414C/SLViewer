//
//  M_ABAPFugrFMParameter.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPFugrFM;

@interface M_ABAPFugrFMParameter : NSManagedObject

@property (nonatomic, retain) NSString * direction;
@property (nonatomic, retain) NSString * fm_uuid;
@property (nonatomic, retain) NSString * index;
@property (nonatomic, retain) NSString * kind;
@property (nonatomic, retain) NSString * optional;
@property (nonatomic, retain) NSString * parameter;
@property (nonatomic, retain) NSString * reference;
@property (nonatomic, retain) NSString * stext;
@property (nonatomic, retain) NSString * typ;
@property (nonatomic, retain) M_ABAPFugrFM *fmp_dm;

@end
