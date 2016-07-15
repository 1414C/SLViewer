//
//  M_ABAPClassEvent.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClass, M_ABAPClassEventParameter;

@interface M_ABAPClassEvent : NSManagedObject

@property (nonatomic, retain) NSString * bcevtcat;
@property (nonatomic, retain) NSString * cls_UUID;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * evt_UUID;
@property (nonatomic, retain) NSString * evtdecltyp;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * refclsname;
@property (nonatomic, retain) NSString * refcmpname;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) M_ABAPClass *clsevt_cls;
@property (nonatomic, retain) NSSet *clsevt_clsevtparam;
@end

@interface M_ABAPClassEvent (CoreDataGeneratedAccessors)

- (void)addClsevt_clsevtparamObject:(M_ABAPClassEventParameter *)value;
- (void)removeClsevt_clsevtparamObject:(M_ABAPClassEventParameter *)value;
- (void)addClsevt_clsevtparam:(NSSet *)values;
- (void)removeClsevt_clsevtparam:(NSSet *)values;

@end
