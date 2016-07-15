//
//  M_ABAPClassMethodParameter.h
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

@class M_ABAPClassMethod;

@interface M_ABAPClassMethodParameter : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * changedon;
@property (nonatomic, retain) NSString * clsname;
@property (nonatomic, retain) NSString * cmpname;
@property (nonatomic, retain) NSString * cmptype;
@property (nonatomic, retain) NSString * createdon;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * dispid;
@property (nonatomic, retain) NSString * editorder;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * langu;
@property (nonatomic, retain) NSString * mtd_UUID;
@property (nonatomic, retain) NSString * mtdtype;
@property (nonatomic, retain) NSString * pardecltyp;
@property (nonatomic, retain) NSString * paroptionl;
@property (nonatomic, retain) NSString * parpastyp;
@property (nonatomic, retain) NSString * parvalue;
@property (nonatomic, retain) NSString * sconame;
@property (nonatomic, retain) NSString * tableof;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * typtype;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) M_ABAPClassMethod *clsmtdparam_clsmtd;

@end
