//
//  ABAPEventDeclTypeTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-25.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
//
// #define k0InstanceEvent @"0"
// #define k1StaticEvent @"1"
//
// #define CO_0InstanceEvt @"Instance Event"
// #define CO_1StaticEvt @"Static Event"

#import "ABAPEventDeclTypeTransformer.h"

@implementation ABAPEventDeclTypeTransformer

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
    
    if([strValue isEqualToString:k0InstanceEvent])
    {
        return CO_0InstanceEvt;
    }
    
    if([strValue isEqualToString:k1StaticEvent])
    {
        return CO_1StaticEvt;
    }
    
    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_0InstanceEvt])
    {
        return k0InstanceEvent;
    }
    
    if([strValue isEqualToString:CO_1StaticEvt])
    {
        return k1StaticEvent;
    }
    
    return @"Undefined";
}
@end
