//
//  M_ABAPClassType.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-16.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClass;

@interface M_ABAPClassType : NSManagedObject

@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * typtype;
@property (nonatomic, retain) NSString * srcrow1;
@property (nonatomic, retain) NSString * srccolumn1;
@property (nonatomic, retain) NSString * srcrow2;
@property (nonatomic, retain) NSString * srccolumn2;
@property (nonatomic, retain) NSString * typesrc_leng;
@property (nonatomic, retain) NSString * typesrc;
@property (nonatomic, retain) M_ABAPClass *clstyp_cls;

@end
