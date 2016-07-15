//
//  ABAPOutlineContent.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-08.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "ABAPOutlineContent.h"
#import "ABAPTreeNode.h"

@implementation ABAPOutlineContent

// build the NSOutlineView content for M_ABAPClasses
-(NSArray*)buildClassContentArrayFromRef:(NSMutableArray __strong**)classArray
{
    // ensure presentation order of childObjects based on index
    _childSD = [[NSSortDescriptor alloc]initWithKey:@"index" ascending:YES];
    
    NSMutableArray *arrayContent = [[NSMutableArray alloc]init];
    
    // loop through the array of managedObjects
    for(M_ABAPClass *ac in *classArray)
    {
        // set root class node
        ABAPTreeNode *treeNode = [ABAPTreeNode makeNodeWithItemName:[ac clsname]
                                                    withDescription:[ac descript]
                                                      withSAPOOType:C_SAPOOClass withEntity:ac
                                                          withIndex:nil];
        
        // if the class has methods, create a Method folder node
        NSSet *setMethods = [ac cls_clsmtd];
        if(setMethods.count >0)
        {
            ABAPTreeNode *leafNode = [ABAPTreeNode makeLeafNodeWithName:@"Methods" withSAPOOType:C_SAPOOMethodLeaf withImage:nil];
            
            [treeNode.mutableChildNodes addObject:leafNode];
            
            // create a node for each method and attach to the Methods leaf node
            for(M_ABAPClassMethod *acm in setMethods)
            {
                ABAPTreeNode *mtdTreeNode = [ABAPTreeNode makeNodeWithItemName:[acm cmpname]
                                                               withDescription:[acm descript]
                                                                 withSAPOOType:C_SAPOOMethod withEntity:acm
                                                                     withIndex:[acm editorder]];
                [leafNode.mutableChildNodes addObject:mtdTreeNode];
            }
            NSArray *arSD = [NSArray arrayWithObject:_childSD];
            [leafNode.mutableChildNodes sortUsingDescriptors:arSD];
        }
        
        
        // if the class has events, create an event folder node
        NSSet *setEvents = [ac cls_clsevt];
        if(setEvents.count >0)
        {
            ABAPTreeNode *leafNode = [ABAPTreeNode makeLeafNodeWithName:@"Events" withSAPOOType:C_SAPOOEventLeaf withImage:nil];
            
            [treeNode.mutableChildNodes addObject:leafNode];
            
            // create a node for each event and attach to the Events leaf node
            for(M_ABAPClassEvent *ace in setEvents)
            {
                ABAPTreeNode *evtTreeNode = [ABAPTreeNode makeNodeWithItemName:[ace cmpname]
                                                               withDescription:[ace descript]
                                                                 withSAPOOType:C_SAPOOEvent withEntity:ace
                                                                     withIndex:[ace editorder]];
                [leafNode.mutableChildNodes addObject:evtTreeNode];
            }
            NSArray *arSD = [NSArray arrayWithObject:_childSD];
            [leafNode.mutableChildNodes sortUsingDescriptors:arSD];
        }
        
        
        // if the class has attributes, create an attributes folder node
        NSSet *setAttributes = [ac cls_clsattr];
        if(setAttributes.count >0)
        {
            ABAPTreeNode *leafNode = [ABAPTreeNode makeLeafNodeWithName:@"Attributes" withSAPOOType:C_SAPOOAttributeLeaf withImage:nil];
            
            [treeNode.mutableChildNodes addObject:leafNode];
            
            // create a node for each attribute and attach to the Attributes leaf node
            for(M_ABAPClassAttribute *aca in setAttributes)
            {
                ABAPTreeNode *attrTreeNode = [ABAPTreeNode makeNodeWithItemName:[aca cmpname]
                                                                withDescription:[aca descript]
                                                                  withSAPOOType:C_SAPOOAttribute
                                                                     withEntity:aca
                                                                      withIndex:[aca editorder]];
                [leafNode.mutableChildNodes addObject:attrTreeNode];
            }
            NSArray *arSD = [NSArray arrayWithObject:_childSD];
            [leafNode.mutableChildNodes sortUsingDescriptors:arSD];
        }
        
        // add the root class node to the list of
        // outlineview content
        [arrayContent addObject:treeNode];
        
    }
    return arrayContent;
}



// build the NSOutlineView content for M_ABAPFugr
// fg = function-group
// afm = abap-function-module
-(NSArray*)buildFugrContentArrayFromRef:(NSMutableArray __strong**)fugrArray
{
    // ensure presentation order of childObjects based on index
    _childSD = [[NSSortDescriptor alloc]initWithKey:@"index" ascending:YES];
    
    NSMutableArray *arrayContent = [[NSMutableArray alloc]init];
    
    // loop through the array of managedObjects
    for(M_ABAPFugr *fg in *fugrArray)
    {
        // set root function group node
        ABAPTreeNode *treeNode = [ABAPTreeNode makeNodeWithItemName:[fg area]
                                                    withDescription:[fg areat]
                                                      withSAPOOType:C_SAPOOFunctionGroup
                                                         withEntity:fg
                                                          withIndex:nil];
        
        // if the fugr has function-modules, create a Function Module folder node
        NSSet *setFMs = [fg fg_fm];
        if(setFMs.count >0)
        {
            ABAPTreeNode *leafNode = [ABAPTreeNode makeLeafNodeWithName:@"Function Modules" withSAPOOType:C_SAPOOFunctionModuleLeaf withImage:nil];
            
            [treeNode.mutableChildNodes addObject:leafNode];
            
            // create a node for each function-module and attach to the FM leaf node
            for(M_ABAPFugrFM *afm in setFMs)
            {
                
                DLog(@"%@",afm.name);
                ABAPTreeNode *afmTreeNode = [ABAPTreeNode makeNodeWithItemName:[afm name]
                                                               withDescription:[afm stext]
                                                                 withSAPOOType:C_SAPOOFunctionModule
                                                                    withEntity:afm
                                                                     withIndex:nil];
                [leafNode.mutableChildNodes addObject:afmTreeNode];
            }
        }
        
        
        // if the fugr has includes, create an includes folder
        NSSet *setIncludes = [fg fg_fgincl];
        if(setIncludes.count >0)
        {
            ABAPTreeNode *leafNode = [ABAPTreeNode makeLeafNodeWithName:@"Includes" withSAPOOType:C_SAPOOFunctionGroupIncludeLeaf withImage:nil];
            
            [treeNode.mutableChildNodes addObject:leafNode];
            
            // create a node for each include and attach to the Includes leaf node
            for(M_ABAPFugrIncl *afgi in setIncludes)
            {
                ABAPTreeNode *afgiTreeNode = [ABAPTreeNode makeNodeWithItemName:[afgi name]
                                                                withDescription:nil
                                                                  withSAPOOType:C_SAPOOFunctionGroupInclude
                                                                     withEntity:afgi
                                                                      withIndex:nil];
                [leafNode.mutableChildNodes addObject:afgiTreeNode];
            }
        }

        [arrayContent addObject:treeNode];
    }
    
    return arrayContent;
}



// build the NSOutlineView content for M_ABAPProgram
-(NSArray*)buildProgContentArrayFromRef:(NSMutableArray __strong**)progArray
{
    NSMutableArray *arrayContent = [[NSMutableArray alloc]init];
    
    // loop through the array of managedObjects
    for(M_ABAPProgram *pg in *progArray)
    {
        // set root program node
        ABAPTreeNode *treeNode = [ABAPTreeNode makeNodeWithItemName:[pg name]
                                                    withDescription:nil
                                                      withSAPOOType:C_SAPOOProgram
                                                         withEntity:pg
                                                          withIndex:nil];
        
        // get the program text elements
        NSSet *setProgramTexts = [pg p_pt];
        
        // if the prog has texts, create a Texts folder node
        if(setProgramTexts.count >0)
        {
            ABAPTreeNode *leafNode = [ABAPTreeNode makeLeafNodeWithName:@"Texts" withSAPOOType:C_SAPOOProgramTextLeaf withImage:nil];
            
            [treeNode.mutableChildNodes addObject:leafNode];
            
            // create a node for each text and attach to the Texts leaf node
            for(M_ABAPProgramText *pgt in setProgramTexts)
            {
                ABAPTreeNode *afmTreeNode;
                
                if([[pgt iid]isEqualToString:@"R"])
                {
                    treeNode.descript = [pgt entry];
                    continue;
                }
                
                if([[pgt iid]isEqualToString:@"S"])
                {
                    afmTreeNode = [ABAPTreeNode makeNodeWithItemName:[pgt key]
                                                     withDescription:[pgt entry]
                                                       withSAPOOType:C_SAPOOProgramText
                                                          withEntity:pgt
                                                           withIndex:nil];
                }
                
                
                if([[pgt iid]isEqualToString:@"I"])
                {
                    afmTreeNode = [ABAPTreeNode makeNodeWithItemName:[pgt key]
                                                     withDescription:[pgt entry]
                                                       withSAPOOType:C_SAPOOProgramText
                                                          withEntity:pgt
                                                           withIndex:nil];
                }
            
                [leafNode.mutableChildNodes addObject:afmTreeNode];
            }
        }
        
        [arrayContent addObject:treeNode];
        
    }
    return arrayContent;
}

@end
