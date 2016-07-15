//
//  ABAPAttrDeclTypeTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-24.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
//  #define k0InstanceAttribute
//  #define k1StaticAttribute
//  #define k2Constant
//
//  #define CO_0InstanceAttr @"Instance Attribute"
//  #define CO_1StaticAttr @"Static Attribute"
//  #define CO_2Constant @"Constant"

#import "ABAPAttrDeclTypeTransformer.h"

@implementation ABAPAttrDeclTypeTransformer

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
    
    if([strValue isEqualToString:k0InstanceAttribute])
    {
        return CO_0InstanceAttr;
    }
    
    if([strValue isEqualToString:k1StaticAttribute])
    {
        return CO_1StaticAttr;
    }
    
    if([strValue isEqualToString:k2ConstantAttribute])
    {
        return CO_2ConstantAttr;
    }

    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_0InstanceAttr])
    {
        return k0InstanceAttribute;
    }
    
    if([strValue isEqualToString:CO_1StaticAttr])
    {
        return k1StaticAttribute;
    }
    
    if([strValue isEqualToString:CO_2ConstantAttr])
    {
        return k2ConstantAttribute;
    }
    
    return @"Undefined";
}


@end
