//
//  ABAPTreeNode.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-08.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

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
