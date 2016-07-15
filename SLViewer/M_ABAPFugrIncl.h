//
//  M_ABAPFugrIncl.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPFugr;

@interface M_ABAPFugrIncl : NSManagedObject

@property (nonatomic, retain) NSString * appl;
@property (nonatomic, retain) NSString * cdat;
@property (nonatomic, retain) NSString * cnam;
@property (nonatomic, retain) NSString * fugr_uuid;
@property (nonatomic, retain) NSString * idate;
@property (nonatomic, retain) NSString * incl_uuid;
@property (nonatomic, retain) NSString * include_source;
@property (nonatomic, retain) NSString * itime;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * rload;
@property (nonatomic, retain) NSString * rmand;
@property (nonatomic, retain) NSString * sdate;
@property (nonatomic, retain) NSString * stime;
@property (nonatomic, retain) NSString * subc;
@property (nonatomic, retain) NSString * uccheck;
@property (nonatomic, retain) NSString * udat;
@property (nonatomic, retain) NSString * unam;
@property (nonatomic, retain) NSString * varcl;
@property (nonatomic, retain) NSString * vern;
@property (nonatomic, retain) M_ABAPFugr *fgincl_fg;

@end
