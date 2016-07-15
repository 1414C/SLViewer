//
//  M_ABAPClassMethod.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-30.
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

@class M_ABAPClass, M_ABAPClassMethodException, M_ABAPClassMethodParameter;

@interface M_ABAPClassMethod : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * bcmtdcat;
@property (nonatomic, retain) NSString * bcmtdsyn;
@property (nonatomic, retain) NSString * changedon;
@property (nonatomic, retain) NSString * cls_UUID;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * createdon;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * dispid;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * mtd_UUID;
@property (nonatomic, retain) NSString * mtddecltyp;
@property (nonatomic, retain) NSString * mtdtype;
@property (nonatomic, retain) NSString * r3release;
@property (nonatomic, retain) id sourcecode;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * cpdname;
@property (nonatomic, retain) M_ABAPClass *clsmtd_cls;
@property (nonatomic, retain) NSSet *clsmtd_clsmtdex;
@property (nonatomic, retain) NSSet *clsmtd_clsmtdparam;
@end

@interface M_ABAPClassMethod (CoreDataGeneratedAccessors)

- (void)addClsmtd_clsmtdexObject:(M_ABAPClassMethodException *)value;
- (void)removeClsmtd_clsmtdexObject:(M_ABAPClassMethodException *)value;
- (void)addClsmtd_clsmtdex:(NSSet *)values;
- (void)removeClsmtd_clsmtdex:(NSSet *)values;

- (void)addClsmtd_clsmtdparamObject:(M_ABAPClassMethodParameter *)value;
- (void)removeClsmtd_clsmtdparamObject:(M_ABAPClassMethodParameter *)value;
- (void)addClsmtd_clsmtdparam:(NSSet *)values;
- (void)removeClsmtd_clsmtdparam:(NSSet *)values;

@end
