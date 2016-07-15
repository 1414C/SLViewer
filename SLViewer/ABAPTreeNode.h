//
//  ABAPTreeNode.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-08.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//
// + (instancetype)treeNodeWithRepresentedObject:(id)modelObject;
// - (instancetype)initWithRepresentedObject:(id)modelObject;
//
// @property (readonly, strong) id representedObject;
//
// stats
// represents the receivers location in entire  tree
// @property (readonly, strong) NSIndexPath *indexPath;

// @property (getter=isLeaf, readonly) BOOL leaf; // determined by (count of child nodes == 0)
//
// @property (readonly, copy) NSArray *childNodes;    // traversal

// returns a mutable proxy -  parentNode of inserted/removed child nodes is automatically updated
// @property (readonly, strong) NSMutableArray *mutableChildNodes;

// traversal begins with receiver
// - (NSTreeNode *)descendantNodeAtIndexPath:(NSIndexPath *)indexPath;

// traversal begins with receiver
// @property (readonly, assign) NSTreeNode *parentNode;
//
// sorts the entire subtree
//- (void)sortWithSortDescriptors:(NSArray *)sortDescriptors recursively:(BOOL)recursively;

#import <Cocoa/Cocoa.h>
#import "ConstantsAndEnums.h"

@interface ABAPTreeNode : NSTreeNode

// properties for display
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *descript;
@property (nonatomic, strong) NSImage *image;

// properties for use following selection
@property (nonatomic,strong) NSString *index;
@property (nonatomic,assign,readwrite) SAPObjType sapootype;
@property (nonatomic,strong) id moEntity;


+(ABAPTreeNode*)makeNodeWithItemName:(NSString*)itemName
                     withDescription:(NSString*)desc
                       withSAPOOType:(SAPObjType)sapObjType
                          withEntity:(id)entity
                           withIndex:(NSString*)index;

+(ABAPTreeNode*)makeLeafNodeWithName:(NSString*)itemName withSAPOOType:(SAPObjType)sapObjType withImage:(NSImage*)img;


@end
