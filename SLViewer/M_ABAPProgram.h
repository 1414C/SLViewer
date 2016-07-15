//
//  M_ABAPProgram.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPProgramText;

@interface M_ABAPProgram : NSManagedObject

@property (nonatomic, retain) NSString * cdat;
@property (nonatomic, retain) NSString * cnam;
@property (nonatomic, retain) NSString * fixpt;
@property (nonatomic, retain) NSString * idate;
@property (nonatomic, retain) NSString * itime;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * prog_uuid;
@property (nonatomic, retain) NSString * rload;
@property (nonatomic, retain) NSString * rmand;
@property (nonatomic, retain) NSString * rstat;
@property (nonatomic, retain) NSString * sdate;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * stime;
@property (nonatomic, retain) NSString * subc;
@property (nonatomic, retain) NSString * uccheck;
@property (nonatomic, retain) NSString * udat;
@property (nonatomic, retain) NSString * unam;
@property (nonatomic, retain) NSString * varcl;
@property (nonatomic, retain) NSString * vern;
@property (nonatomic, retain) NSSet *p_pt;
@end

@interface M_ABAPProgram (CoreDataGeneratedAccessors)

- (void)addP_ptObject:(M_ABAPProgramText *)value;
- (void)removeP_ptObject:(M_ABAPProgramText *)value;
- (void)addP_pt:(NSSet *)values;
- (void)removeP_pt:(NSSet *)values;

@end
