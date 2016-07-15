//
//  ABAPTreeNode.h
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
