//
//  ABAPMethodTypeCategoryTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-21.
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

// ABAP method category (MTDTYPE)
// #define kABAPMethodCategoryMethod0 @"0"
// #define kABAPMethodCategoryEventHandlingMethod1 @"1"
// #define kABAPMethodCategoryConstructor2 @"2"
// #define kABAPMethodCategoryDestructor3 @"3"
// #define kABAPMethodCategoryVAGetMethod4 @"4"
// #define kABAPMethodCategoryVASetMethod5 @"5"
// #define kABAPMethodCategoryABAPUnitTestMethod6 @"6"
//
// #define CO_ABAPMethodCategoryMethod @"Method"
// #define CO_APMethodCategoryEventHandlingMethod @"Event handling method"
// #define CO_ABAPMethodCategoryConstructor @"Constructor"
// #define CO_ABAPMethodCategoryDestructor @"Destructor"
// #define CO_ABAPMethodCategoryVAGetMethod @"Get method of virtual attribute"
// #define CO_ABAPMethodCategoryVASetMethod @"Set method of virtual attribute"
// #define CO_ABAPMethodCategoryABAPUnitTestMethod @"Test method of ABAP Unit"


#import "ABAPMethodTypeCategoryTransformer.h"

@implementation ABAPMethodTypeCategoryTransformer

+(Class)transformedValueClass
{
    return [NSString class];
}

+(BOOL)allowsReverseTransformation
{
    return YES;
}

-(id)transformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:kABAPMethodCategoryMethod0])
    {
        return CO_ABAPMethodCategoryMethod;
    }
    
    if([strValue isEqualToString:kABAPMethodCategoryEventHandlingMethod1])
    {
        return CO_APMethodCategoryEventHandlingMethod;
    }
    
    if([strValue isEqualToString:kABAPMethodCategoryConstructor2])
    {
        return CO_ABAPMethodCategoryConstructor;
    }
    
    if([strValue isEqualToString:kABAPMethodCategoryDestructor3])
    {
        return CO_ABAPMethodCategoryDestructor;
    }
    
    if([strValue isEqualToString:kABAPMethodCategoryVAGetMethod4])
    {
        return CO_ABAPMethodCategoryVAGetMethod;
    }
    
    if([strValue isEqualToString:kABAPMethodCategoryVASetMethod5])
    {
        return CO_ABAPMethodCategoryVASetMethod;
    }
    
    if([strValue isEqualToString:kABAPMethodCategoryABAPUnitTestMethod6])
    {
        return CO_ABAPMethodCategoryABAPUnitTestMethod;
    }
    
    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_ABAPMethodCategoryMethod])
    {
        return kABAPMethodCategoryMethod0;
    }
    
    if([strValue isEqualToString:CO_APMethodCategoryEventHandlingMethod])
    {
        return kABAPMethodCategoryEventHandlingMethod1;
    }
    
    if([strValue isEqualToString:CO_ABAPMethodCategoryConstructor])
    {
        return kABAPMethodCategoryConstructor2;
    }
    
    if([strValue isEqualToString:CO_ABAPMethodCategoryDestructor])
    {
        return kABAPMethodCategoryDestructor3;
    }
    
    if([strValue isEqualToString:CO_ABAPMethodCategoryVAGetMethod])
    {
        return kABAPMethodCategoryVAGetMethod4;
    }
    
    if([strValue isEqualToString:CO_ABAPMethodCategoryVASetMethod])
    {
        return kABAPMethodCategoryVASetMethod5;
    }
    
    if([strValue isEqualToString:CO_ABAPMethodCategoryABAPUnitTestMethod])
    {
        return kABAPMethodCategoryABAPUnitTestMethod6;
    }
    
    return @"Undefined";
}


@end
