//
//  M_ABAPFugr.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-15.
//
///////////////////////////////////////////////////////////////////////////////////////
// The MIT License (MIT) - see LICENSE.md
//
// Copyright (c) 2016 Steve MacLeod
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//////////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class M_ABAPFugrFM, M_ABAPFugrIncl;

@interface M_ABAPFugr : NSManagedObject

@property (nonatomic, retain) NSString * appl;
@property (nonatomic, retain) NSString * area;
@property (nonatomic, retain) NSString * areat;
@property (nonatomic, retain) NSString * cdat;
@property (nonatomic, retain) NSString * cnam;
@property (nonatomic, retain) NSString * dbapl;
@property (nonatomic, retain) NSString * dbna;
@property (nonatomic, retain) NSString * fixpt;
@property (nonatomic, retain) NSString * fugr_uuid;
@property (nonatomic, retain) NSString * idate;
@property (nonatomic, retain) NSString * itime;
@property (nonatomic, retain) NSString * ldbname;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * rload;
@property (nonatomic, retain) NSString * rmand;
@property (nonatomic, retain) NSString * sdate;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * stime;
@property (nonatomic, retain) NSString * subc;
@property (nonatomic, retain) NSString * uccheck;
@property (nonatomic, retain) NSString * udat;
@property (nonatomic, retain) NSString * unam;
@property (nonatomic, retain) NSString * varcl;
@property (nonatomic, retain) NSString * vern;
@property (nonatomic, retain) NSSet *fg_fgincl;
@property (nonatomic, retain) NSSet *fg_fm;
@end

@interface M_ABAPFugr (CoreDataGeneratedAccessors)

- (void)addFg_fginclObject:(M_ABAPFugrIncl *)value;
- (void)removeFg_fginclObject:(M_ABAPFugrIncl *)value;
- (void)addFg_fgincl:(NSSet *)values;
- (void)removeFg_fgincl:(NSSet *)values;

- (void)addFg_fmObject:(M_ABAPFugrFM *)value;
- (void)removeFg_fmObject:(M_ABAPFugrFM *)value;
- (void)addFg_fm:(NSSet *)values;
- (void)removeFg_fm:(NSSet *)values;

@end
