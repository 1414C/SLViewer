//
//  M_ABAPProgramText.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPProgram;

@interface M_ABAPProgramText : NSManagedObject

@property (nonatomic, retain) NSString * entry;
@property (nonatomic, retain) NSString * iid;
@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSString * length;
@property (nonatomic, retain) NSString * prog_uuid;
@property (nonatomic, retain) M_ABAPProgram *pt_p;

@end
