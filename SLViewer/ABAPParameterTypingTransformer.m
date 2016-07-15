//
//  ABAPParameterTypingTransformer.m
//  SLBrowser
//
//  Created by stephen macleod on 2015-03-20.
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
// #define CO_4UNDEF @"TYPE"       // use TYPE
// #define CO_5BOXED @"TYPE...BOXED"


#import "ABAPParameterTypingTransformer.h"

@implementation ABAPParameterTypingTransformer


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
    
    if([strValue isEqualToString:k0LIKE])
    {
        return CO_0LIKE;
    }
    
    if([strValue isEqualToString:k1TYPE])
    {
        return CO_1TYPE;
    }
    
    if([strValue isEqualToString:k2TYPEOBJ])
    {
        return CO_2TYPEOBJ;
    }
    
    if([strValue isEqualToString:k3TYPEREFTO])
    {
        return CO_3TYPEREFTO;
    }
    
    if([strValue isEqualToString:k4UNDEF])
    {
        return CO_4UNDEF;
    }
    
    if([strValue isEqualToString:k5BOXED])
    {
        return CO_5BOXED;
    }
    
    return @"Undefined";
    
}

- (id)reverseTransformedValue:(id)value
{
    NSString *strValue = value;
    
    if([strValue isEqualToString:CO_0LIKE])
    {
        return k0LIKE;
    }
    
    if([strValue isEqualToString:CO_1TYPE])
    {
        return k1TYPE;
    }
    
    if([strValue isEqualToString:CO_2TYPEOBJ])
    {
        return k2TYPEOBJ;
    }
    
    if([strValue isEqualToString:CO_3TYPEREFTO])
    {
        return k3TYPEREFTO;
    }
    
    if([strValue isEqualToString:CO_4UNDEF])
    {
        return k4UNDEF;
    }
    
    if([strValue isEqualToString:CO_5BOXED])
    {
        return k5BOXED;
    }
    
    return @"Undefined";
}


@end
