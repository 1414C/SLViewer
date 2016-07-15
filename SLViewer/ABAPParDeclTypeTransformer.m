//
//  ABAPParDeclTypeTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-24.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
// ABAP parameter declaration type (PARDECLTYP)
// #define k0Importing 0
// #define k1Exporting 1
// #define k2Changing 2
// #define k3Returning 3
//
// #define CO_0Importing @"Imp"
// #define CO_1Exporting @"Exp"
// #define CO_2Changing @"Chg"
// #define CO_3Returning @"Ret"

#import "ABAPParDeclTypeTransformer.h"

@implementation ABAPParDeclTypeTransformer

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
    
    if([strValue isEqualToString:k0Importing])
    {
        return CO_0Importing;
    }
    
    if([strValue isEqualToString:k1Exporting])
    {
        return CO_1Exporting;
    }
    
    if([strValue isEqualToString:k2Changing])
    {
        return CO_2Changing;
    }
    
    if([strValue isEqualToString:k3Returning])
    {
        return CO_3Returning;
    }
    
    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_0Importing])
    {
        return k0Importing;
    }
    
    if([strValue isEqualToString:CO_1Exporting])
    {
        return k1Exporting;
    }
    
    if([strValue isEqualToString:CO_2Changing])
    {
        return k2Changing;
    }
    
    if([strValue isEqualToString:CO_3Returning])
    {
        return k3Returning;
    }
    
    return @"Undefined";
}


@end
