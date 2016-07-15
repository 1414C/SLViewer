//
//  ABAPParameterTypingTransformer.h
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-20.
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
//
// TYPTYPE
// ABAP parameter typing definition
// #define k0LIKE @"0"
// #define k1TYPE @"1"
// #define k2TYPEOBJ @"2"
// #define k3TYPEREFTO @"3"
// #define k4UNDEF @"4"       // use TYPE
// #define k5BOXED @"5"
//
// #define CO_0LIKE @"LIKE"
// #define CO_1TYPE @"TYPE"
// #define CO_2TYPEOBJ @"TYPE"
// #define CO_3TYPEREFTO @"TYPE-REF-TO"
// #define CO_4UNDEF @"LTYPE"       // use TYPE
// #define CO_5BOXED @"TYPE...BOXED"

#import <Foundation/Foundation.h>
#import "ConstantsAndEnums.h"

@interface ABAPParameterTypingTransformer : NSValueTransformer

@end
