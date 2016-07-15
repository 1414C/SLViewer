//
//  DataManager.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-01.
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

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "M_ABAPClass.h"
#import "M_ABAPFugr.h"
#import "M_ABAPProgram.h"

@interface DataManager : NSObject

// core data
@property (nonatomic,strong) NSManagedObjectContext *mObjectContext;


+(id)sharedCollectionMgr;


// cleanup
-(BOOL)purgeDB;

// M_ABAPClass prototypes
-(M_ABAPClass*)createABAPClassFromDict:(NSDictionary*)d;
-(M_ABAPClass*)addABAPClassAttributeWithClass:(M_ABAPClass*)ac withDict:(NSDictionary*)ad;
-(BOOL)addABAPClassAttrWithClass:(M_ABAPClass __strong**)ac withDict:(NSDictionary*)ad withCommit:(BOOL)bCommit;

// M_ABAPClassMethod prototypes
-(BOOL)addABAPClassMethodToClass:(M_ABAPClass __strong**)ac withMethodDict:(NSMutableDictionary*)dm withCommit:(BOOL)bCommit;
-(BOOL)addABAPClassMethodRedefToClass:(M_ABAPClass __strong**)ac withRedefDict:(NSDictionary*)dm;


// M_ABAPClassEvent prototypes
-(BOOL)addABAPClassEventToClass:(M_ABAPClass __strong**)ac withEventDict:(NSMutableDictionary*)de withCommit:(BOOL)bCommit;

// M_ABAPClassType prototypes
-(BOOL)addABAPTypeToClass:(M_ABAPClass __strong**)ac withTypeDict:(NSDictionary*)dt;


// misc ABAPClass source code updates
-(BOOL)addABAPClassLocalImplementation:(NSString*)strLISource toClass:(M_ABAPClass __strong**)ac;
-(BOOL)addABAPClassLocalTypes:(NSString*)strLclTypes toClass:(M_ABAPClass __strong**)ac;
-(BOOL)addABAPClassLocalMacros:(NSString*)strLMSource toClass:(M_ABAPClass __strong**)ac;
-(BOOL)addABAPClassPublicSection:(NSString*)strPubSource toClass:(M_ABAPClass __strong**)ac;
-(BOOL)addABAPClassProtectedSection:(NSString*)strPrtSource toClass:(M_ABAPClass __strong**)ac;
-(BOOL)addABAPClassPrivateSection:(NSString*)strPvtSource toClass:(M_ABAPClass __strong**)ac;


// M_ABAPClass lookups 
-(NSArray*)getAllABAPClasses;
-(NSArray*)getABAPClassesForPredicate:(NSPredicate*)predicate;



// ABAPFugr prototypes
-(M_ABAPFugr*)createABAPFugrFromDict:(NSDictionary*)d;
-(BOOL)updateABAPFugr:(M_ABAPFugr __strong**)fg withDict:(NSDictionary*)d;
-(BOOL)setFugrSource:(M_ABAPFugr __strong**)fg withMainProgram:(NSString*)s;
-(BOOL)setFugrIncludes:(M_ABAPFugr __strong**)fg withInclDict:(NSDictionary*)di;
-(BOOL)setFugrFM:(M_ABAPFugr __strong**)fg withFMDict:(NSDictionary*)dfm;


// M_ABAPFugr lookups
-(NSArray*)getAllABAPFugr;
-(NSArray*)getABAPFugrForPredicate:(NSPredicate*)predicate;


// ABAPProgram prototypes
-(M_ABAPProgram*)createABAPProgramFromDict:(NSDictionary*)d;
-(BOOL)setProgSource:(M_ABAPProgram __strong**)pg detailsFromDict:(NSDictionary*)d;


// M_ABAPProgram lookups
-(NSArray*)getAllABAPPrograms;
-(NSArray*)getABAPProgramsForPredicate:(NSPredicate*)predicate;


@end
