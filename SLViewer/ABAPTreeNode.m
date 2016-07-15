//
//  ABAPTreeNode.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-08.
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
#import "ABAPTreeNode.h"

@implementation ABAPTreeNode

+(ABAPTreeNode*)makeNodeWithItemName:(NSString*)itemName
                     withDescription:(NSString*)desc
                       withSAPOOType:(SAPObjType)sapObjType
                          withEntity:(id)entity
                           withIndex:(NSString *)index
{
    ABAPTreeNode *tn = [[ABAPTreeNode alloc]init];
    
    tn.itemName = itemName;
    tn.descript = desc;
    tn.sapootype = sapObjType;
    tn.moEntity = entity;
    tn.index = index;
    
    return tn;
}


+(ABAPTreeNode*)makeLeafNodeWithName:(NSString*)itemName withSAPOOType:(SAPObjType)sapObjType withImage:(NSImage*)img
{
    ABAPTreeNode *tn = [[ABAPTreeNode alloc]init];
    
    tn.itemName = itemName;
    tn.descript = nil;
    tn.sapootype = sapObjType;
    tn.moEntity = nil;
    tn.index = nil;
    
    if(img)
    {
        tn.image = img;
    }
    else
    {
        tn.image = nil;
    }
    return tn;
}


@end
