//
//  ABAPParDeclTypeTransformer.m
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
