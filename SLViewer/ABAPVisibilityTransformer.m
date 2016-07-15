//
//  ABAPVisibilityTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-20.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
// kABAPVisbilityPrivate

#import "ABAPVisibilityTransformer.h"

@implementation ABAPVisibilityTransformer


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
    
    if([strValue isEqualToString:kABAPVisbilityPrivate])
    {
        return CO_ABAPVisibilityPrivate;
    }
    
    if([strValue isEqualToString:kABAPVisibilityProtected])
    {
        return CO_ABAPVisibilityProtected;
    }
    
    if([strValue isEqualToString:kABAPVisibilityPublic])
    {
        return CO_ABAPVisibilityPublic;
    }
    
    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_ABAPVisibilityPrivate])
    {
        return kABAPVisbilityPrivate;
    }
    
    if([strValue isEqualToString:CO_ABAPVisibilityProtected])
    {
        return kABAPVisibilityProtected;
    }
    
    if([strValue isEqualToString:CO_ABAPVisibilityPublic])
    {
        return kABAPVisibilityPublic;
    }
    
    return @"Undefined";
}

@end
