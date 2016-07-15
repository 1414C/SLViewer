//
//  M_ABAPClassAttribute.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClass;

@interface M_ABAPClassAttribute : NSManagedObject

@property (nonatomic, retain) NSString * attdecltyp;
@property (nonatomic, retain) NSString * attexpvirt;
@property (nonatomic, retain) NSString * attvalue;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * changedby;
@property (nonatomic, retain) NSString * changedon;
@property (nonatomic, retain) NSString * cls_UUID;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * createdon;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * r3release;
@property (nonatomic, retain) NSString * srccolumn1;
@property (nonatomic, retain) NSString * srccolumn2;
@property (nonatomic, retain) NSString * srcrow1;
@property (nonatomic, retain) NSString * srcrow2;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * typesrc_leng;
@property (nonatomic, retain) NSString * typtype;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * attrdonly;
@property (nonatomic, retain) M_ABAPClass *clsattr_cls;

@end
