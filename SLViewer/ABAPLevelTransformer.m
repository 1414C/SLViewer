//
//  ABAPLevelTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-20.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
//  transform ABAP level -> text
//  0 == instance
//  1 == static

#import "ABAPLevelTransformer.h"

@implementation ABAPLevelTransformer


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
    
    if([strValue isEqualToString:kABAPLevelStatic])
    {
        return CO_ABAPLevelStatic;
    }
    
    if([strValue isEqualToString:kABAPLevelInstance])
    {
        return CO_ABAPLevelInstance;
    }
    
    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_ABAPLevelStatic])
    {
        return kABAPLevelStatic;
    }
    
    if([strValue isEqualToString:CO_ABAPLevelInstance])
    {
        return kABAPLevelInstance;
    }
    
    return @"Undefined";
}


@end
