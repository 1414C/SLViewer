//
//  ABAPEventCategoryTransformer.h
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-25.
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

//  #define k0CreateEvtCategory @"0"
//  #define k1ChangeEvtCategory @"1"
//  #define k2DeleteEvtCategory @"2"
//  #define k3MiscEvtCategory @"3"
//
//  #define CO_0CreateEventCat @"Create"
//  #define CO_1ChangeEventCat @"Change"
//  #define CO_2DeleteEventCat @"Delete"
//  #define CO_3MiscEventCat @"Misc."

#import <Foundation/Foundation.h>
#import "ConstantsAndEnums.h"

@interface ABAPEventCategoryTransformer : NSValueTransformer

@end
