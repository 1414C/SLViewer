//
//  M_ABAPFugrFM.h
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
