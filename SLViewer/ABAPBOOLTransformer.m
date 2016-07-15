//
//  ABAPBOOLTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-21.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "ABAPBOOLTransformer.h"

@implementation ABAPBOOLTransformer

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
    
    if([strValue isEqualToString:@"1"] || [strValue isEqualToString:@"x"] || [strValue isEqualTo:@"X"])
    {
        return @1;
    }
    
    return @0;
    
}

- (id)reverseTransformedValue:(id)value
{
    // __NSCFNumber is private subclass of NSNumber
    // so test for NSNumber via selector
    if([value respondsToSelector:@selector(integerValue)])
    {
        if([value integerValue] == 1)
        {
            return @"1";
        }
    }
    return @"";
}


@end
