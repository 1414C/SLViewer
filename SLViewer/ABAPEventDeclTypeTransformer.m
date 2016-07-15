//
//  ABAPEventDeclTypeTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-25.
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
