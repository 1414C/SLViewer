//
//  ABAPAttrDeclTypeTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-24.
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
