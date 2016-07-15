//
//  M_ABAPClassMethod.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-30.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClass, M_ABAPClassMethodException, M_ABAPClassMethodParameter;

@interface M_ABAPClassMethod : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * bcmtdcat;
@property (nonatomic, retain) NSString * bcmtdsyn;
@property (nonatomic, retain) NSString * changedon;
@property (nonatomic, retain) NSString * cls_UUID;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * createdon;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * dispid;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * mtd_UUID;
@property (nonatomic, retain) NSString * mtddecltyp;
@property (nonatomic, retain) NSString * mtdtype;
@property (nonatomic, retain) NSString * r3release;
@property (nonatomic, retain) id sourcecode;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * cpdname;
@property (nonatomic, retain) M_ABAPClass *clsmtd_cls;
@property (nonatomic, retain) NSSet *clsmtd_clsmtdex;
@property (nonatomic, retain) NSSet *clsmtd_clsmtdparam;
@end

@interface M_ABAPClassMethod (CoreDataGeneratedAccessors)

- (void)addClsmtd_clsmtdexObject:(M_ABAPClassMethodException *)value;
- (void)removeClsmtd_clsmtdexObject:(M_ABAPClassMethodException *)value;
- (void)addClsmtd_clsmtdex:(NSSet *)values;
- (void)removeClsmtd_clsmtdex:(NSSet *)values;

- (void)addClsmtd_clsmtdparamObject:(M_ABAPClassMethodParameter *)value;
- (void)removeClsmtd_clsmtdparamObject:(M_ABAPClassMethodParameter *)value;
- (void)addClsmtd_clsmtdparam:(NSSet *)values;
- (void)removeClsmtd_clsmtdparam:(NSSet *)values;

@end
