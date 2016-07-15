//
//  M_ABAPClass.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-30.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClassAttribute, M_ABAPClassEvent, M_ABAPClassMethod, M_ABAPClassMethodRedef, M_ABAPClassType;

@interface M_ABAPClass : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * changedby;
@property (nonatomic, retain) NSString * changedon;
@property (nonatomic, retain) NSString * chdanyon;
@property (nonatomic, retain) NSString * clsbccat;
@property (nonatomic, retain) NSString * clsccincl;
@property (nonatomic, retain) NSString * clsfinal;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * createdon;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * duration_type;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) NSString * filename;
@property (nonatomic, retain) NSString * fixpt;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * r3release;
@property (nonatomic, retain) NSString * refclsname;
@property (nonatomic, retain) NSString * rel;
@property (nonatomic, retain) NSString * risk_level;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * strLocalImplementationSource;
@property (nonatomic, retain) NSString * strLocalMacroSource;
@property (nonatomic, retain) NSString * strLocalTypeSource;
@property (nonatomic, retain) NSString * strPrivateSectionSource;
@property (nonatomic, retain) NSString * strProtectedSectionSource;
@property (nonatomic, retain) NSString * strPublicSectionSource;
@property (nonatomic, retain) NSString * unicode;
@property (nonatomic, retain) NSString * uuid;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSSet *cls_clsattr;
@property (nonatomic, retain) NSSet *cls_clsevt;
@property (nonatomic, retain) NSSet *cls_clsmtd;
@property (nonatomic, retain) NSSet *cls_clstyp;
@property (nonatomic, retain) NSSet *cls_clsmtdrdef;
@end

@interface M_ABAPClass (CoreDataGeneratedAccessors)

- (void)addCls_clsattrObject:(M_ABAPClassAttribute *)value;
- (void)removeCls_clsattrObject:(M_ABAPClassAttribute *)value;
- (void)addCls_clsattr:(NSSet *)values;
- (void)removeCls_clsattr:(NSSet *)values;

- (void)addCls_clsevtObject:(M_ABAPClassEvent *)value;
- (void)removeCls_clsevtObject:(M_ABAPClassEvent *)value;
- (void)addCls_clsevt:(NSSet *)values;
- (void)removeCls_clsevt:(NSSet *)values;

- (void)addCls_clsmtdObject:(M_ABAPClassMethod *)value;
- (void)removeCls_clsmtdObject:(M_ABAPClassMethod *)value;
- (void)addCls_clsmtd:(NSSet *)values;
- (void)removeCls_clsmtd:(NSSet *)values;

- (void)addCls_clstypObject:(M_ABAPClassType *)value;
- (void)removeCls_clstypObject:(M_ABAPClassType *)value;
- (void)addCls_clstyp:(NSSet *)values;
- (void)removeCls_clstyp:(NSSet *)values;

- (void)addCls_clsmtdrdefObject:(M_ABAPClassMethodRedef *)value;
- (void)removeCls_clsmtdrdefObject:(M_ABAPClassMethodRedef *)value;
- (void)addCls_clsmtdrdef:(NSSet *)values;
- (void)removeCls_clsmtdrdef:(NSSet *)values;

@end
