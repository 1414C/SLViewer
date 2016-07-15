//
//  ABAPOutlineContent.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-08.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "M_ABAPClass.h"
#import "M_ABAPClassAttribute.h"
#import "M_ABAPClassEvent.h"
#import "M_ABAPClassMethod.h"
#import "M_ABAPFugr.h"
#import "M_ABAPFugrIncl.h"
#import "M_ABAPFugrFM.h"
#import "M_ABAPProgram.h"
#import "M_ABAPProgramText.h"


@interface ABAPOutlineContent : NSObject
{
    NSSortDescriptor *_childSD;
}

-(NSArray*)buildClassContentArrayFromRef:(NSMutableArray __strong**)classArray;
-(NSArray*)buildFugrContentArrayFromRef:(NSMutableArray __strong**)fugrArray;
-(NSArray*)buildProgContentArrayFromRef:(NSMutableArray __strong**)progArray;

@end
