//
//  ABAPMethodTypeCategoryTransformer.h
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-21.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
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

#import <Foundation/Foundation.h>
#import "ConstantsAndEnums.h"

@interface ABAPMethodTypeCategoryTransformer : NSValueTransformer

@end
