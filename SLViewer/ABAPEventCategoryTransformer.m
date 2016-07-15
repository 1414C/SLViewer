//
//  ABAPEventCategoryTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-25.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
//  #define k0CreateEvtCategory @"0"
//  #define k1ChangeEvtCategory @"1"
//  #define k2DeleteEvtCategory @"2"
//  #define k3MiscEvtCategory @"3"
//
//  #define CO_0CreateEventCat @"Create"
//  #define CO_1ChangeEventCat @"Change"
//  #define CO_2DeleteEventCat @"Delete"
//  #define CO_3MiscEventCat @"Misc."


#import "ABAPEventCategoryTransformer.h"

@implementation ABAPEventCategoryTransformer

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
    
    if([strValue isEqualToString:k0CreateEvtCategory])
    {
        return CO_0CreateEventCat;
    }
    
    if([strValue isEqualToString:k1ChangeEvtCategory])
    {
        return CO_1ChangeEventCat;
    }
    
    if([strValue isEqualToString:k2DeleteEvtCategory])
    {
        return CO_2DeleteEventCat;
    }
    
    if([strValue isEqualToString:k3MiscEvtCategory])
    {
        return CO_3MiscEventCat;
    }
    
    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_0CreateEventCat])
    {
        return k0CreateEvtCategory;
    }
    
    if([strValue isEqualToString:CO_1ChangeEventCat])
    {
        return k1ChangeEvtCategory;
    }
    
    if([strValue isEqualToString:CO_2DeleteEventCat])
    {
       return k2DeleteEvtCategory;
    }
    
    if([strValue isEqualToString:CO_3MiscEventCat])
    {
        return k3MiscEvtCategory;
    }
    
    return @"Undefined";
}

@end
