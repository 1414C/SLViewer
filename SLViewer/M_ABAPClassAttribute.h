//
//  M_ABAPClassAttribute.h
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

@class M_ABAPClass;

@interface M_ABAPClassAttribute : NSManagedObject

@property (nonatomic, retain) NSString * attdecltyp;
@property (nonatomic, retain) NSString * attexpvirt;
@property (nonatomic, retain) NSString * attvalue;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * changedby;
@property (nonatomic, retain) NSString * changedon;
@property (nonatomic, retain) NSString * cls_UUID;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * createdon;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * exposure;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * r3release;
@property (nonatomic, retain) NSString * srccolumn1;
@property (nonatomic, retain) NSString * srccolumn2;
@property (nonatomic, retain) NSString * srcrow1;
@property (nonatomic, retain) NSString * srcrow2;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * typesrc_leng;
@property (nonatomic, retain) NSString * typtype;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * attrdonly;
@property (nonatomic, retain) M_ABAPClass *clsattr_cls;

@end
