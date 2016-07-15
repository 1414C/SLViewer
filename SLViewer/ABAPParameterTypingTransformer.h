//
//  ABAPParameterTypingTransformer.h
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-20.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
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
