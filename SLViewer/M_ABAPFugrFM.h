//
//  M_ABAPFugrFM.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPFugr, M_ABAPFugrFMParameter;

@interface M_ABAPFugrFM : NSManagedObject

@property (nonatomic, retain) NSString * fm_source;
@property (nonatomic, retain) NSString * fm_uuid;
@property (nonatomic, retain) NSString * fugr_uuid;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * stext;
@property (nonatomic, retain) M_ABAPFugr *fm_fg;
@property (nonatomic, retain) NSSet *fm_fmp;
@end

@interface M_ABAPFugrFM (CoreDataGeneratedAccessors)

- (void)addFm_fmpObject:(M_ABAPFugrFMParameter *)value;
- (void)removeFm_fmpObject:(M_ABAPFugrFMParameter *)value;
- (void)addFm_fmp:(NSSet *)values;
- (void)removeFm_fmp:(NSSet *)values;

@end
