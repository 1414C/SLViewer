//
//  ABAPEventCategoryTransformer.m
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
