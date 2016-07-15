//
//  M_ABAPClassEventParameter.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPClassEvent;

@interface M_ABAPClassEventParameter : NSManagedObject

@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * cmptype;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * dispid;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * evt_UUID;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * mtdtype;
@property (nonatomic, retain) NSString * paroptionl;
@property (nonatomic, retain) NSString * parpasstyp;
@property (nonatomic, retain) NSString * parvalue;
@property (nonatomic, retain) NSString * sconame;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * typtype;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) M_ABAPClassEvent *clsevtparam_clsevt;

@end
