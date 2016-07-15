//
//  DataManager.m
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

#import "DataManager.h"
#import "M_ABAPClass.h"
#import "M_ABAPClassAttribute.h"
#import "M_ABAPClassType.h"
#import "M_ABAPClassEvent.h"
#import "M_ABAPClassEventParameter.h"
#import "M_ABAPClassMethod.h"
#import "M_ABAPClassMethodRedef.h"
#import "M_ABAPClassMethodParameter.h"
#import "M_ABAPClassMethodException.h"
#import "AppDelegate.h"
#import "ConstantsAndEnums.h"
#import "M_ABAPFugrIncl.h"
#import "M_ABAPFugrFM.h"
#import "M_ABAPFugrFMParameter.h"
#import "M_ABAPProgramText.h"



@implementation DataManager


// generic init - works for admin and user mode
-(id)init
{
    self = [super init];
    
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    return (self);
}


// singleton for all data manager access
+(id)sharedCollectionMgr
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred,^{
        _sharedObject = [[self alloc]init];
    });
    return _sharedObject;
}


#pragma mark - cleanup
-(BOOL)purgeDB
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    NSDistributedNotificationCenter *ndc = [NSDistributedNotificationCenter defaultCenter];
    
    
    NSMutableArray *arrayABAPClasses = (NSMutableArray*)[self getAllABAPClasses];
    for(M_ABAPClass *ac in arrayABAPClasses)
    {
        NSString *msg = [NSString stringWithFormat:@"Purging object: %@",ac.clsname];
        NSDictionary *dictObject = [NSDictionary dictionaryWithObjectsAndKeys:msg,@"importMsg", nil];
        [ndc postNotificationName:kImportLogMsg object:nil userInfo:dictObject];
        [_mObjectContext deleteObject:ac];
    }
    
    NSMutableArray *arrayABAPFugrs = (NSMutableArray*)[self getAllABAPFugr];
    for(M_ABAPFugr *fg in arrayABAPFugrs)
    {
        NSString *msg = [NSString stringWithFormat:@"Purging object: %@",fg.area];
        NSDictionary *dictObject = [NSDictionary dictionaryWithObjectsAndKeys:msg,@"importMsg", nil];
        [ndc postNotificationName:kImportLogMsg object:nil userInfo:dictObject];
        [_mObjectContext deleteObject:fg];
    }
    
    NSMutableArray *arrayABAPPrograms = (NSMutableArray*)[self getAllABAPPrograms];
    for(M_ABAPProgram *p in arrayABAPPrograms)
    {
        NSString *msg = [NSString stringWithFormat:@"Purging object: %@",p.name];
        NSDictionary *dictObject = [NSDictionary dictionaryWithObjectsAndKeys:msg,@"importMsg", nil];
        [ndc postNotificationName:kImportLogMsg object:nil userInfo:dictObject];
        [_mObjectContext deleteObject:p];
    }
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"DB purge failure: %@",error);
        return NO;
    }
    
    NSString *msg = [NSString stringWithFormat:@"Purge completed"];
    NSDictionary *dictObject = [NSDictionary dictionaryWithObjectsAndKeys:msg,@"importMsg", nil];
    [ndc postNotificationName:kImportLogMsg object:nil userInfo:dictObject];
    
    return YES;
}


#pragma mark - M_ABAPClass access methods
// create the basic M_ABAPClass entity
-(M_ABAPClass*)createABAPClassFromDict:(NSDictionary*)d
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    
    // build fetch request for M_ABAPClass
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPClass"
                                                inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(clsname = %@)", [d valueForKey:C_AC_clsname]];
    [request setPredicate:predicate];
    
    // execute request for M_ABAPClass
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"ABAPClass does not already exist in data store");
    }
    else
    {
        for(M_ABAPClass *cls in mutableFetchResults)
        {
            DLog(@"Deleting M_ABAPClass: %@ to overwrite",cls.uuid);
            [_mObjectContext deleteObject:cls];
        }
    }
    
    M_ABAPClass *ac = (M_ABAPClass*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClass"
                                                                  inManagedObjectContext:_mObjectContext];
    
    // use internally generated UUID for class
    NSString *strClassUUID = [[NSProcessInfo processInfo]globallyUniqueString];
    [ac setUuid:strClassUUID];
    
    // set class properties from the dictionary
    DLog(@"%@",[d valueForKey:C_AC_category]);
    [ac setCategory:[d valueForKey:C_AC_category]];
    [ac setUnicode:[d valueForKey:C_AC_unicode]];
    [ac setChangedon:[d valueForKey:C_AC_changedon]];
    [ac setClsccincl:[d valueForKey:C_AC_clsccincl]];
    [ac setChdanyon:[d valueForKey:C_AC_chdanyon]];
    [ac setDescript:[d valueForKey:C_AC_descript]];
    [ac setAuthor:[d valueForKey:C_AC_author]];
    [ac setState:[d valueForKey:C_AC_state]];
    [ac setUuid:[[NSProcessInfo processInfo]globallyUniqueString]];
    [ac setR3release:[d valueForKey:C_AC_r3release]];
    [ac setExposure:[d valueForKey:C_AC_exposure]];
    [ac setRefclsname:[d valueForKey:C_AC_refclsname]];
    [ac setCreatedon:[d valueForKey:C_AC_createdon]];
    [ac setLangu:[d valueForKey:C_AC_langu]];
    [ac setClsfinal:[d valueForKey:C_AC_clsfinal]];
    [ac setVersion:[d valueForKey:C_AC_version]];
    [ac setRisk_level:[d valueForKey:C_AC_risk_level]];
    [ac setChangedby:[d valueForKey:C_AC_changedby]];
    [ac setClsbccat:[d valueForKey:C_AC_clsbccat]];
    [ac setDuration_type:[d valueForKey:C_AC_duration_type]];
    [ac setFixpt:[d valueForKey:C_AC_fixpt]];
    [ac setClsname:[d valueForKey:C_AC_clsname]];
    [ac setRel:[d valueForKey:C_AC_rel]];
    [ac setItemName:[d valueForKey:C_AC_itemName]];
    // @dynamic cls_clsattr;
    // @dynamic cls_clsevt;
    // @dynamic cls_clsmtd;
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass persistance failure with: %@",error);
    }
    
    return ac;
}



// M_ABAPClass source code updates
-(BOOL)addABAPClassLocalImplementation:(NSString*)strLISource toClass:(M_ABAPClass __strong**)ac
{
    // DLog(@"insertedObjects: %@",[_mObjectContext insertedObjects]);
    // DLog(@"registeredObjects: %@",[_mObjectContext registeredObjects]);
    
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*ac setStrLocalImplementationSource:strLISource];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass local source update failure with: %@",error);
        return NO;
    }
    
    return YES;
}

-(BOOL)addABAPClassLocalTypes:(NSString*)strLclTypes toClass:(M_ABAPClass __strong**)ac
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*ac setStrLocalTypeSource:strLclTypes];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass local types update failure with: %@",error);
        return NO;
    }
    
    return YES;
}

-(BOOL)addABAPClassLocalMacros:(NSString*)strLMSource toClass:(M_ABAPClass __strong**)ac;
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*ac setStrLocalMacroSource:strLMSource];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass local macro source update failure with: %@",error);
        return NO;
    }
    
    return YES;
}

-(BOOL)addABAPClassPublicSection:(NSString*)strPubSource toClass:(M_ABAPClass __strong**)ac;
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*ac setStrPublicSectionSource:strPubSource];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass public section source update failure with: %@",error);
        return NO;
    }
    
    return YES;
}

-(BOOL)addABAPClassProtectedSection:(NSString*)strPrtSource toClass:(M_ABAPClass __strong**)ac;
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*ac setStrProtectedSectionSource:strPrtSource];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass protected section source update failure with: %@",error);
        return NO;
    }
    
    return YES;
}

-(BOOL)addABAPClassPrivateSection:(NSString*)strPvtSource toClass:(M_ABAPClass __strong**)ac;
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*ac setStrPrivateSectionSource:strPvtSource];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass public section source update failure with: %@",error);
        return NO;
    }
    
    return YES;
}


// create a M_ABAPClassAttribute and add to M_ABAPClass
-(M_ABAPClass*)addABAPClassAttributeWithClass:(M_ABAPClass*)ac withDict:(NSDictionary*)ad
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    M_ABAPClassAttribute *attr = (M_ABAPClassAttribute*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassAttribute"
                                                                  inManagedObjectContext:_mObjectContext];
    
    [attr setSrcrow1:[ad valueForKey:C_ACA_srcrow1]];
    [attr setChangedon:[ad valueForKey:C_ACA_changedon]];
    [attr setAttvalue:[ad valueForKey:C_ACA_attvalue]];
    [attr setCmpname:[ad valueForKey:C_ACA_cmpname]];
    [attr setDescript:[ad valueForKey:C_ACA_descript]];
    [attr setType:[ad valueForKey:C_ACA_type]];
    [attr setTyptype:[ad valueForKey:C_ACA_typtype]];
    [attr setTypesrc_leng:[ad valueForKey:C_ACA_typesrc_leng]];
    [attr setAuthor:[ad valueForKey:C_ACA_author]];
    [attr setAttexpvirt:[ad valueForKey:C_ACA_attexpvirt]];
    [attr setState:[ad valueForKey:C_ACA_state]];
    [attr setAttdecltyp:[ad valueForKey:C_ACA_attdecltyp]];
    [attr setEditorder:[ad valueForKey:C_ACA_editorder]];
    [attr setR3release:[ad valueForKey:C_ACA_r3release]];
    [attr setExposure:[ad valueForKey:C_ACA_exposure]];
    [attr setSrccolumn2:[ad valueForKey:C_ACA_srccolumn2]];
    [attr setCreatedon:[ad valueForKey:C_ACA_createdon]];
    [attr setLangu:[ad valueForKey:C_ACA_langu]];
    [attr setVersion:[ad valueForKey:C_ACA_version]];
    [attr setSrccolumn1:[ad valueForKey:C_ACA_srccolumn1]];
    [attr setChangedby:[ad valueForKey:C_ACA_changedby]];
    [attr setClsname:[ad valueForKey:C_ACA_clsname]];
    [attr setSrcrow2:[ad valueForKey:C_ACA_srcrow2]];
    [attr setItemName:[ad valueForKey:C_ACA_itemName]];
    [attr setCls_UUID:ac.uuid];
    // @dynamic clsattr_cls;
    
    
    [ac addCls_clsattrObject:attr];
    
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClass persistance failure while updating Class Attributes with: %@",error);
    }
    return ac;
}


-(BOOL)addABAPTypeToClass:(M_ABAPClass __strong**)ac withTypeDict:(NSDictionary *)dt
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }

    M_ABAPClassType *aclt = (M_ABAPClassType*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassType"
                                                                            inManagedObjectContext:_mObjectContext];
    
    
    [aclt setCmpname:[dt valueForKey:C_ACT_cmpname]];
    [aclt setVersion:[dt valueForKey:C_ACT_version]];
    [aclt setLangu:[dt valueForKey:C_ACT_langu]];
    [aclt setDescript:[dt valueForKey:C_ACT_descript]];
    [aclt setExposure:[dt valueForKey:C_ACT_exposure]];
    [aclt setState:[dt valueForKey:C_ACT_state]];
    [aclt setEditorder:[dt valueForKey:C_ACT_editorder]];
    [aclt setTyptype:[dt valueForKey:C_ACT_typptype]];
    [aclt setSrcrow1:[dt valueForKey:C_ACT_srcrow1]];
    [aclt setSrccolumn1:[dt valueForKey:C_ACT_srccolumn1]];
    [aclt setSrcrow2:[dt valueForKey:C_ACT_srcrow2]];
    [aclt setSrccolumn2:[dt valueForKey:C_ACT_srccolumn2]];
    [aclt setTypesrc_leng:[dt valueForKey:C_ACT_typesrc_leng]];
    [aclt setTypesrc:[dt valueForKey:C_ACT_typesrc]];
    
    [*ac addCls_clstypObject:aclt];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"M_ABAPClassType persistance failure while updating Class Types: %@",error);
    }
    
    return YES;
}


// create a M_ABAPClassAttribute and add to M_ABAPClass - M_ABAPClass is
// passed through the message mechanism by reference
-(BOOL)addABAPClassAttrWithClass:(M_ABAPClass __strong**)ac withDict:(NSDictionary*)ad withCommit:(BOOL)bCommit
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    M_ABAPClassAttribute *attr = (M_ABAPClassAttribute*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassAttribute"
                                                                                      inManagedObjectContext:_mObjectContext];
    
    [attr setSrcrow1:[ad valueForKey:C_ACA_srcrow1]];
    [attr setChangedon:[ad valueForKey:C_ACA_changedon]];
    [attr setAttvalue:[ad valueForKey:C_ACA_attvalue]];
    [attr setCmpname:[ad valueForKey:C_ACA_cmpname]];
    [attr setDescript:[ad valueForKey:C_ACA_descript]];
    [attr setType:[ad valueForKey:C_ACA_type]];
    [attr setTyptype:[ad valueForKey:C_ACA_typtype]];
    [attr setTypesrc_leng:[ad valueForKey:C_ACA_typesrc_leng]];
    [attr setAuthor:[ad valueForKey:C_ACA_author]];
    [attr setAttexpvirt:[ad valueForKey:C_ACA_attexpvirt]];
    [attr setState:[ad valueForKey:C_ACA_state]];
    [attr setAttdecltyp:[ad valueForKey:C_ACA_attdecltyp]];
    [attr setEditorder:[ad valueForKey:C_ACA_editorder]];
    [attr setR3release:[ad valueForKey:C_ACA_r3release]];
    [attr setExposure:[ad valueForKey:C_ACA_exposure]];
    [attr setSrccolumn2:[ad valueForKey:C_ACA_srccolumn2]];
    [attr setCreatedon:[ad valueForKey:C_ACA_createdon]];
    [attr setLangu:[ad valueForKey:C_ACA_langu]];
    [attr setVersion:[ad valueForKey:C_ACA_version]];
    [attr setSrccolumn1:[ad valueForKey:C_ACA_srccolumn1]];
    [attr setChangedby:[ad valueForKey:C_ACA_changedby]];
    [attr setClsname:[ad valueForKey:C_ACA_clsname]];
    [attr setSrcrow2:[ad valueForKey:C_ACA_srcrow2]];
    [attr setItemName:[ad valueForKey:C_ACA_itemName]];
    [attr setAttrdonly:[ad valueForKey:C_ACA_attrdonly]];
    [attr setCls_UUID:[*ac uuid]];
    // @dynamic clsattr_cls;
    
    
    [*ac addCls_clsattrObject:attr];
    
    if(bCommit)
    {
        if(![_mObjectContext save:&error])
        {
            DLog(@"M_ABAPClass persistance failure while updating Class Attributes with: %@",error);
            return NO;
        }
    }
    return YES;
}



// add a M_ABAPClassMethod to the referenced M_ABAPClass
-(BOOL)addABAPClassMethodToClass:(M_ABAPClass __strong**)ac withMethodDict:(NSMutableDictionary*)dm withCommit:(BOOL)bCommit
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    // set the method header information
    M_ABAPClassMethod *mtd = (M_ABAPClassMethod*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassMethod"
                                                                                      inManagedObjectContext:_mObjectContext];
    
    [mtd setCmpname:[dm valueForKey:C_ACM_cmpname]];
    [mtd setBcmtdsyn:[dm valueForKey:C_ACM_bcmtdsyn]];
    [mtd setMtddecltyp:[dm valueForKey:C_ACM_mtddecltyp]];
    [mtd setAuthor:[dm valueForKey:C_ACM_author]];
    [mtd setBcmtdcat:[dm valueForKey:C_ACM_bcmtdcat]];
    [mtd setState:[dm valueForKey:C_ACM_state]];
    [mtd setLangu:[dm valueForKey:C_ACM_langu]];
    [mtd setR3release:[dm valueForKey:C_ACM_r3release]];
    [mtd setExposure:[dm valueForKey:C_ACM_exposure]];
    [mtd setChangedon:[dm valueForKey:C_ACM_changedon]];
    [mtd setCreatedon:[dm valueForKey:C_ACM_createdon]];
    [mtd setVersion:[dm valueForKey:C_ACM_version]];
    [mtd setDispid:[dm valueForKey:C_ACM_dispid]];
    [mtd setEditorder:[dm valueForKey:C_ACM_editorder]];
    [mtd setMtdtype:[dm valueForKey:C_ACM_mtdtype]];
    [mtd setDescript:[dm valueForKey:C_ACM_descript]];
    [mtd setClsname:[dm valueForKey:C_ACM_clsname]];
    [mtd setItemName:[dm valueForKey:C_ACM_itemName]];
    [mtd setSourcecode:[dm valueForKey:C_ACM_sourcecode]];
    [mtd setCls_UUID:[*ac uuid]];
    [mtd setMtd_UUID:[[NSProcessInfo processInfo]globallyUniqueString]];
    

    // set the method parameters
    NSMutableSet *mtdParams = [mtd mutableSetValueForKey:@"clsmtd_clsmtdparam"];
    
    // iterate through the parameters array
    for(NSMutableDictionary *d in [dm valueForKey:C_arrayMtdParamsKey])
    {
        M_ABAPClassMethodParameter *mp = (M_ABAPClassMethodParameter*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassMethodParameter" inManagedObjectContext:_mObjectContext];
        
        [mp setTableof:[d valueForKey:C_ACMP_tableof]];
        [mp setParoptionl:[d valueForKey:C_ACMP_paroptionl]];
        [mp setParvalue:[d valueForKey:C_ACMP_parvalue]];
        [mp setCmpname:[d valueForKey:C_ACMP_cmpname]];
        [mp setParpastyp:[d valueForKey:C_ACMP_parpastyp]];
        [mp setAuthor:[d valueForKey:C_ACMP_author]];
        [mp setCmptype:[d valueForKey:C_ACMP_cmptype]];
        [mp setLangu:[d valueForKey:C_ACMP_langu]];
        [mp setSconame:[d valueForKey:C_ACMP_sconame]];
        [mp setPardecltyp:[d valueForKey:C_ACMP_pardecltyp]];
        [mp setChangedon:[d valueForKey:C_ACMP_changedon]];
        [mp setCreatedon:[d valueForKey:C_ACMP_createdon]];
        [mp setVersion:[d valueForKey:C_ACMP_version]];
        [mp setDispid:[d valueForKey:C_ACMP_dispid]];
        [mp setEditorder:[d valueForKey:C_ACMP_editorder]];
        [mp setMtdtype:[d valueForKey:C_ACMP_mtdtype]];
        [mp setDescript:[d valueForKey:C_ACMP_descript]];
        [mp setClsname:[d valueForKey:C_ACMP_clsname]];
        [mp setTyptype:[d valueForKey:C_ACMP_typtype]];
        [mp setType:[d valueForKey:C_ACMP_type]];
        [mp setItemName:[d valueForKey:C_ACMP_itemName]];
        [mp setMtd_UUID:[mtd mtd_UUID]];
        [mtdParams addObject:mp];
        
    }
    
    
    NSMutableSet *mtdExceptions = [mtd mutableSetValueForKey:@"clsmtd_clsmtdex"];
    
    // iterate through the exceptions array
    for(NSMutableDictionary *d in [dm valueForKey:C_arrayMtdExcptnsKey])
    {
        M_ABAPClassMethodException *me = (M_ABAPClassMethodException*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassMethodException"inManagedObjectContext:_mObjectContext];
        
        [me setCmpname:[d valueForKey:C_ACME_cmpname]];
        [me setEditorder:[d valueForKey:C_ACME_editorder]];
        [me setChangedon:[d valueForKey:C_ACME_changedon]];
        [me setClsname:[d valueForKey:C_ACME_clsname]];
        [me setMtdtype:[d valueForKey:C_ACME_mtdtype]];
        [me setDescript:[d valueForKey:C_ACME_descript]];
        [me setLangu:[d valueForKey:C_ACME_langu]];
        [me setCreatedon:[d valueForKey:C_ACME_createdon]];
        [me setAuthor:[d valueForKey:C_ACME_author]];
        [me setVersion:[d valueForKey:C_ACME_version]];
        [me setSconame:[d valueForKey:C_ACME_sconame]];
        [me setItemName:[d valueForKey:C_ACME_itemName]];
        [me setMtd_UUID:[mtd mtd_UUID]];
        [mtdExceptions addObject:me];
        
//        @dynamic clsmtdex_mtd;
        
    }
    
    
    // add parameters and exceptions to method
    [mtd addClsmtd_clsmtdparam:mtdParams];
    [mtd addClsmtd_clsmtdex:mtdExceptions];
    
    // write to the db
    [*ac addCls_clsmtdObject:mtd];
     
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager addABAPClassMethodToClass:(M_ABAPClass __strong**)ac withMethodDict:(NSMutableDictionary*)dm withCommit:(BOOL)bCommit; MethodInfo:%@",mtd.description);
        return NO;
    }
    
    return YES;
}


// add a M_ABAPClassMethodRedef to the referenced M_ABAPClass
-(BOOL)addABAPClassMethodRedefToClass:(M_ABAPClass __strong**)ac withRedefDict:(NSDictionary*)dm
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    // set the method header information
    M_ABAPClassMethodRedef *mtdrdef = (M_ABAPClassMethodRedef*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassMethodRedef"
                                                                               inManagedObjectContext:_mObjectContext];
    
    [mtdrdef setClsname:[dm valueForKey:C_ACMR_clsname]];
    [mtdrdef setRefclsname:[dm valueForKey:C_ACMR_refclsname]];
    [mtdrdef setVersion:[dm valueForKey:C_ACMR_version]];
    [mtdrdef setMtdname:[dm valueForKey:C_ACMR_mtdname]];
    [mtdrdef setExposure:[dm valueForKey:C_ACMR_exposure]];
    
    [*ac addCls_clsmtdrdefObject:mtdrdef];

    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager addABAPClassMethodRedefToClass:(M_ABAPClass __strong**)ac withMethodDict:(NSMutableDictionary*)dm; MethodInfo:%@",mtdrdef.description);
        return NO;
    }
    
    return YES;
}



// add a M_ABAPClassEvent to the referenced M_ABAPClass
-(BOOL)addABAPClassEventToClass:(M_ABAPClass *__strong *)ac withEventDict:(NSMutableDictionary *)de withCommit:(BOOL)bCommit
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    // set the event header information
    M_ABAPClassEvent *evt = (M_ABAPClassEvent*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassEvent"
                                                                               inManagedObjectContext:_mObjectContext];
    
    [evt setRefcmpname:[de valueForKey:C_ACE_refcmpname]];
    [evt setRefclsname:[de valueForKey:C_ACE_refclsname]];
    [evt setCmpname:[de valueForKey:C_ACE_cmpname]];
    [evt setEditorder:[de valueForKey:C_ACE_editorder]];
    [evt setState:[de valueForKey:C_ACE_state]];
    [evt setClsname:[de valueForKey:C_ACE_clsname]];
    [evt setDescript:[de valueForKey:C_ACE_descript]];
    [evt setLangu:[de valueForKey:C_ACE_langu]];
    [evt setBcevtcat:[de valueForKey:C_ACE_bcevtcat]];
    [evt setEvtdecltyp:[de valueForKey:C_ACE_evtdecltyp]];
    [evt setVersion:[de valueForKey:C_ACE_version]];
    [evt setExposure:[de valueForKey:C_ACE_exposure]];
    [evt setItemName:[de valueForKey:C_ACE_itemName]];
    [evt setCls_UUID:[de valueForKey:C_ACE_cls_UUID]];
    [evt setEvt_UUID:[[NSProcessInfo processInfo]globallyUniqueString]];
    // @dynamic clsevt_cls;
    // @dynamic clsevt_clsevtparam;
    
    
    NSMutableSet *evtParams = [evt mutableSetValueForKey:@"clsevt_clsevtparam"];
    
    // iterate through the event parameters array
    for(NSMutableDictionary *d in [de valueForKey:C_arrayEvtParamsKey])
    {
        M_ABAPClassEventParameter *evtp = (M_ABAPClassEventParameter*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPClassEventParameter"
                                                                                 inManagedObjectContext:_mObjectContext];
        
        [evtp setParvalue:[d valueForKey:C_ACEP_parvalue]];
        [evtp setParoptionl:[d valueForKey:C_ACEP_paroptionl]];
        [evtp setCmpname:[d valueForKey:C_ACEP_cmpname]];
        [evtp setParpasstyp:[d valueForKey:C_ACEP_parpasstyp]];
        [evtp setCmptype:[d valueForKey:C_ACEP_cmptype]];
        [evtp setLangu:[d valueForKey:C_ACEP_langu]];
        [evtp setSconame:[d valueForKey:C_ACEP_sconame]];
        [evtp setVersion:[d valueForKey:C_ACEP_version]];
        [evtp setDispid:[d valueForKey:C_ACEP_dispid]];
        [evtp setEditorder:[d valueForKey:C_ACEP_editorder]];
        [evtp setMtdtype:[d valueForKey:C_ACEP_mtdtype]];
        [evtp setDescript:[d valueForKey:C_ACEP_descript]];
        [evtp setClsname:[d valueForKey:C_ACEP_clsname]];
        [evtp setTyptype:[d valueForKey:C_ACEP_typtype]];
        [evtp setType:[d valueForKey:C_ACEP_type]];
        [evtp setItemName:[d valueForKey:C_ACEP_itemName]];
        [evtp setEvt_UUID:evt.evt_UUID];
        [evtParams addObject:evtp];
        
    }
    
    [evt addClsevt_clsevtparam:evtParams];
    
    // write to the db
    [*ac addCls_clsevtObject:evt];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager addABAPClassEventToClass:(M_ABAPClass __strong**)ac withEventDict:(NSMutableDictionary*)de withCommit:(BOOL)bCommit; EventInfo:%@",evt.description);
        return NO;
    }
    
    return YES;
    
}


#pragma mark - M_ABAPClass lookups
// M_ABAPClass lookups
-(NSMutableArray*)getAllABAPClasses
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    // build fetch request for M_ABAPClass
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPClass"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];

    // execute request for M_ABAPClass
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"No ABAPClasses found");
        return nil;
    }
    else
    {
        return [mutableFetchResults copy];
    }
    
    return nil;
}


-(NSMutableArray*)getABAPClassesForPredicate:(NSPredicate*)predicate
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    // build fetch request for M_ABAPClass
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPClass"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(area = %@)", [d valueForKey:C_AFG_area]];
    [request setPredicate:predicate];
    
    // execute request for M_ABAPClass
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"No ABAPClasses found");
        return nil;
    }
    else
    {
        return [mutableFetchResults copy];   // immutable NSArray
    }

    return nil;
}






#pragma mark - M_ABAPFugr element processing
// create the new FUGR header
-(M_ABAPFugr*)createABAPFugrFromDict:(NSDictionary*)d
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    
    // build fetch request for M_ABAPFugr
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPFugr"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(area = %@)", [d valueForKey:C_AFG_area]];
    [request setPredicate:predicate];
    
    // execute request for M_ABAPFugr
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"ABAPFugr does not already exist in data store");
    }
    else
    {
        for(M_ABAPFugr *fugr in mutableFetchResults)
        {
            DLog(@"Deleting M_ABAPFugr: %@ to overwrite",fugr.fugr_uuid);
            [_mObjectContext deleteObject:fugr];
        }
    }
    
    M_ABAPFugr *afg = (M_ABAPFugr*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPFugr"
                                                                  inManagedObjectContext:_mObjectContext];
    
    // use internally generated UUID for fugr.fugr_uuid
    [afg setFugr_uuid:[[NSProcessInfo processInfo]globallyUniqueString]];
    
    // set class properties from the dictionary
    [afg setArea:[d valueForKey:C_AFG_area]];
    [afg setAreat:[d valueForKey:C_AFG_areat]];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager createABAPFugrFromDict:(NSDictionary*)d:%@",error);
        return nil;
    }

    return afg;
}



-(BOOL)updateABAPFugr:(M_ABAPFugr __strong**)fg withDict:(NSDictionary *)d
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*fg setName:[d valueForKey:C_AFG_name]];
    [*fg setVarcl:[d valueForKey:C_AFG_varcl]];
    [*fg setDbapl:[d valueForKey:C_AFG_dbapl]];
    [*fg setDbna:[d valueForKey:C_AFG_dbna]];
    [*fg setSubc:[d valueForKey:C_AFG_subc]];
    [*fg setAppl:[d valueForKey:C_AFG_appl]];
    [*fg setCnam:[d valueForKey:C_AFG_cnam]];
    [*fg setCdat:[d valueForKey:C_AFG_cdat]];
    [*fg setUnam:[d valueForKey:C_AFG_unam]];
    [*fg setUdat:[d valueForKey:C_AFG_udat]];
    [*fg setVern:[d valueForKey:C_AFG_vern]];
    [*fg setRmand:[d valueForKey:C_AFG_rmand]];
    [*fg setRload:[d valueForKey:C_AFG_rload]];
    [*fg setFixpt:[d valueForKey:C_AFG_fixpt]];
    [*fg setSdate:[d valueForKey:C_AFG_sdate]];
    [*fg setStime:[d valueForKey:C_AFG_stime]];
    [*fg setItime:[d valueForKey:C_AFG_itime]];
    [*fg setIdate:[d valueForKey:C_AFG_idate]];
    [*fg setLdbname:[d valueForKey:C_AFG_ldbname]];
    [*fg setUccheck:[d valueForKey:C_AFG_uccheck]];
    
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager createABAPFugrFromDict:(NSDictionary*)d:%@",error);
        return NO;
    }
    
    return YES;
    
}


// set the FUGR main program source
// note that for now, we do not bother
// with the dynpro header, dynpro fields,
// or the <dynproflowsource>
-(BOOL)setFugrSource:(M_ABAPFugr __strong**)fg withMainProgram:(NSString*)s
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    [*fg setSource:s];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager setFugrSource:(M_ABAPFugr __strong**)fg withMainProgram:(NSString*)s: %@",error);
        return NO;
    }
    
    return YES;
}


// set the FUGR includes (header and source)
-(BOOL)setFugrIncludes:(M_ABAPFugr __strong**)fg withInclDict:(NSDictionary*)di
{
    NSError *error;
    
    // always make sure there is an instance of the mOC (should be)
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    M_ABAPFugrIncl *afgi = (M_ABAPFugrIncl*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPFugrIncl"
                                                                 inManagedObjectContext:_mObjectContext];
    
    
    
    [afgi setFugr_uuid:[*fg fugr_uuid]];
    [afgi setIncl_uuid:[[NSProcessInfo processInfo]globallyUniqueString]];
    [afgi setName:[di valueForKey:C_AFGI_name]];
    [afgi setVarcl:[di valueForKey:C_AFGI_varcl]];
    [afgi setSubc:[di valueForKey:C_AFGI_subc]];
    [afgi setAppl:[di valueForKey:C_AFGI_appl]];
    [afgi setCnam:[di valueForKey:C_AFGI_cnam]];
    [afgi setCdat:[di valueForKey:C_AFGI_cdat]];
    [afgi setUnam:[di valueForKey:C_AFGI_unam]];
    [afgi setUdat:[di valueForKey:C_AFGI_udat]];
    [afgi setVern:[di valueForKey:C_AFGI_vern]];
    [afgi setRmand:[di valueForKey:C_AFGI_rmand]];
    [afgi setRload:[di valueForKey:C_AFGI_rload]];
    [afgi setSdate:[di valueForKey:C_AFGI_sdate]];
    [afgi setIdate:[di valueForKey:C_AFGI_idate]];
    [afgi setItime:[di valueForKey:C_AFGI_itime]];
    [afgi setUccheck:[di valueForKey:C_AFGI_uccheck]];
    [afgi setInclude_source:[di valueForKey:C_AFGI_include_source]];
    
    [*fg addFg_fginclObject:afgi];
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager setFugrIncludes:(M_ABAPFugr __strong**)fg withInclDict:(NSDictionary*)di %@",error);
        return NO;
    }
    
    return YES;
}


// set a FM on a FGRP
-(BOOL)setFugrFM:(M_ABAPFugr __strong**)fg withFMDict:(NSDictionary*)dfm
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    
    M_ABAPFugrFM *afm = (M_ABAPFugrFM*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPFugrFM"
                                                                     inManagedObjectContext:_mObjectContext];
    
    [afm setFugr_uuid:[*fg fugr_uuid]];
    [afm setFm_uuid:[[NSProcessInfo processInfo]globallyUniqueString]];
    [afm setName:[dfm valueForKey:C_AFM_name]];
    [afm setStext:[dfm valueForKey:C_AFM_stext]];
    [afm setFm_source:[dfm valueForKey:C_AFM_fm_source]];
    
    NSArray *arParamDocu = [dfm valueForKey:C_arrayFMDocuKey];
    
    for(NSDictionary *d in [dfm valueForKey:C_arrayFMParamsKey])
    {
        M_ABAPFugrFMParameter *afmp = (M_ABAPFugrFMParameter*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPFugrFMParameter"
                                                                         inManagedObjectContext:_mObjectContext];
        
        [afmp setFm_uuid:[afm fm_uuid]];
        [afmp setParameter:[d valueForKey:C_AFMP_parameter]];
        if(![afmp parameter])
        {
            [afmp setParameter:[d valueForKey:C_AFMP_exception]];
        }
        [afmp setDirection:[d valueForKey:C_AFMP_direction]];
        [afmp setTyp:[d valueForKey:C_AFMP_typ]];
        [afmp setOptional:[d valueForKey:C_AFMP_optional]];
        [afmp setReference:[d valueForKey:C_AFMP_reference]];

        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(PARAMETER == %@)",[afmp parameter]];
        NSArray *a = [arParamDocu filteredArrayUsingPredicate:predicate];
        
        if(a.count > 0)
        {
            [afmp setKind:(NSString*)[a[0] valueForKey:C_AFMP_kind]];
            [afmp setStext:(NSString*)[a[0] valueForKey:C_AFMP_stext]];
            [afmp setIndex:(NSString*)[a[0] valueForKey:C_AFMP_index]];
        }
        
        // add the parameter to the FM - this includes exceptions
        [afm addFm_fmpObject:afmp];
    }
    
    
    [*fg addFg_fmObject:afm];
    
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager setFugrFM:(M_ABAPFugr __strong**)fg withFMDict:(NSDictionary*)dfm %@",error);
        return NO;
    }
    
    return YES;
}


#pragma mark - M_ABAPFugr lookups
// M_ABAPFugr lookups
-(NSArray*)getAllABAPFugr
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    // build fetch request for M_ABAPFugr
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPFugr"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    // execute request for M_ABAPFugr
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"No ABAP function groups found");
        return nil;
    }
    else
    {
        return [mutableFetchResults copy];   // immutable NSArray
    }
    
    return nil;
}

-(NSArray*)getABAPFugrForPredicate:(NSPredicate*)predicate
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    // build fetch request for M_ABAPFugr
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPFugr"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(area = %@)", [d valueForKey:C_AFG_area]];
    [request setPredicate:predicate];
    
    // execute request for M_ABAPfugr
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"No ABAP function groups found");
        return nil;
    }
    else
    {
        return [mutableFetchResults copy];   // immutable NSArray
    }
    
    return nil;
}



#pragma mark - M_ABAPProgram methods
-(M_ABAPProgram*)createABAPProgramFromDict:(NSDictionary*)d
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    // build fetch request for M_ABAPProgram
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPProgram"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name = %@)", [d valueForKey:C_P_name]];
    [request setPredicate:predicate];
    
    // execute request for M_ABAPProgram
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"ABAPProgram does not already exist in data store");
    }
    else
    {
        for(M_ABAPProgram *pg in mutableFetchResults)
        {
            DLog(@"Deleting M_ABAPProgram: %@ %@ to overwrite",pg.name, pg.prog_uuid);
            [_mObjectContext deleteObject:pg];
        }
    }
    
    
    M_ABAPProgram *ap = (M_ABAPProgram*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPProgram"
                                                                     inManagedObjectContext:_mObjectContext];
    
    [ap setProg_uuid:[[NSProcessInfo processInfo]globallyUniqueString]];
    [ap setName:[d valueForKey:C_P_name]];
    [ap setVarcl:[d valueForKey:C_P_varcl]];
    [ap setSubc:[d valueForKey:C_P_subc]];
    [ap setCnam:[d valueForKey:C_P_cnam]];
    [ap setCdat:[d valueForKey:C_P_cdat]];
    [ap setUnam:[d valueForKey:C_P_unam]];
    [ap setUdat:[d valueForKey:C_P_udat]];
    [ap setVern:[d valueForKey:C_P_vern]];
    [ap setRstat:[d valueForKey:C_P_rstat]];
    [ap setRmand:[d valueForKey:C_P_rmand]];
    [ap setRload:[d valueForKey:C_P_rload]];
    [ap setFixpt:[d valueForKey:C_P_fixpt]];
    [ap setSdate:[d valueForKey:C_P_sdate]];
    [ap setStime:[d valueForKey:C_P_stime]];
    [ap setIdate:[d valueForKey:C_P_idate]];
    [ap setItime:[d valueForKey:C_P_itime]];
    [ap setUccheck:[d valueForKey:C_P_uccheck]];
    // @dynamic source;
    // @dynamic p_pt;
    
    
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager createABAPProgramFromDict:(NSDictionary*)d %@",error);
        return nil;
    }
    
    return ap;
}



-(BOOL)setProgSource:(M_ABAPProgram __strong**)pg detailsFromDict:(NSDictionary*)d
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }

    [*pg setSource:[d valueForKey:C_P_source]];
    
    NSArray *arTexts = [d valueForKey:C_arrayProgTextsKey];
    for(M_ABAPProgramText *pt in arTexts)
    {
        M_ABAPProgramText *apt = (M_ABAPProgramText*)[NSEntityDescription insertNewObjectForEntityForName:@"M_ABAPProgramText"
                                                                          inManagedObjectContext:_mObjectContext];
        
        [apt setProg_uuid:[*pg prog_uuid]];
        [apt setIid:[pt valueForKey:C_PT_iid]];
        [apt setKey:[pt valueForKey:C_PT_key]];
        [apt setEntry:[pt valueForKey:C_PT_entry]];
        [apt setLength:[pt valueForKey:C_PT_length]];
        
        [*pg addP_ptObject:apt];
        
    }
    
    
    if(![_mObjectContext save:&error])
    {
        DLog(@"Save operation failed in [DataManager setProgSource:(M_ABAPProgram __strong**)pg detailsFromDict:(NSDictionary*)d %@",error);
        return NO;
    }
    
    return YES;
}



#pragma mark - M_ABAPProgram lookups
// M_ABAPProgram lookups
-(NSArray*)getAllABAPPrograms
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    // build fetch request for M_ABAPProgram
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPProgram"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    // execute request for M_ABAPProgram
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"No ABAP programs found");
        return nil;
    }
    else
    {
        return [mutableFetchResults copy];   // immutable NSArray
    }
    
    return nil;
}

-(NSArray*)getABAPProgramsForPredicate:(NSPredicate*)predicate
{
    NSError *error;
    
    // always make sure there is an instance of the mOC
    if(_mObjectContext == nil)
    {
        _mObjectContext = [(AppDelegate *)[[NSApplication sharedApplication]delegate]managedObjectContext];
    }
    
    // build fetch request for M_ABAPProgram
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPProgram"
                                              inManagedObjectContext:_mObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(area = %@)", [d valueForKey:C_AFG_area]];
    [request setPredicate:predicate];
    
    // execute request for M_ABAPProgram
    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
    if(!mutableFetchResults)
    {
        DLog(@"No ABAP programs found");
        return nil;
    }
    else
    {
        return [mutableFetchResults copy];   // immutable NSArray
    }
    
    return nil;
}



//{
//    // build fetch request for M_ABAPClass
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"M_ABAPClass"
//                                              inManagedObjectContext:_mObjectContext];
//    
//    NSFetchRequest *request = [[NSFetchRequest alloc]init];
//    [request setEntity:entity];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(uuid = %@)", [*ac uuid]];
//    [request setPredicate:predicate];
//    
//    // execute request for M_ABAPClass
//    NSError *error;
//    NSMutableArray *mutableFetchResults = [[_mObjectContext executeFetchRequest:request error:&error]mutableCopy];
//    if(!mutableFetchResults)
//    {
//        DLog(@"CoreData request for M_ABAPClass failed in [DataManager addABAPClassLocalImplementation:(NSString*)strLISource toClass:(M_ABAPClass __strong**)ac");
//    }
//    
//    M_ABAPClass *readClass = [mutableFetchResults objectAtIndex:0];
//    DLog(@"M_ABAPClass uuid: %@",readClass.uuid);
//    for(M_ABAPClassAttribute *a in readClass.cls_clsattr)
//    {
//        DLog(@"Attribute cmpname: %@",a.cmpname);
//    }



@end
