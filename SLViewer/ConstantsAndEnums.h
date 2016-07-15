//
//  ConstantsAndEnums.h
//  SimpleXMLParsing
//
//  Created by stephen macleod on 2015-03-11.
//  Copyright (c) 2015 stephen macleod. All rights reserved.
//

#ifndef SimpleXMLParsing_ConstantsAndEnums_h
#define SimpleXMLParsing_ConstantsAndEnums_h

//typedef NS_ENUM(int,SLElementType)
//{
//    C_SL_class,
//    C_SL_publicSection,
//    C_SL_protectedSection,
//    C_SL_privateSection,
//    C_SL_localImplementation,
//    C_SL_localTypes,
//    C_SL_localMacros,
//    C_SL_attribute,
//    C_SL_method,
//    C_SL_parameter,
//    C_SL_source
//};

//
//enum{
//    C_SL_class,
//    C_SL_publicSection,
//    C_SL_protectedSection,
//    C_SL_privateSection,
//    C_SL_localImplementation,
//    C_SL_localTypes,
//    C_SL_localMacros,
//    C_SL_attribute,
//    C_SL_method,
//    C_SL_parameter,
//    C_SL_source
//} typedef SLElementType;
typedef NS_ENUM(int,SAPObjType)
{
    C_SAPOOClass,
    C_SAPOOMethodLeaf,
    C_SAPOOMethod,
    C_SAPOOMethodParameterLeaf,
    C_SAPOOMethodParameter,
    C_SAPOOMethodParameterIMG,
    C_SAPOOMethodExceptionLeaf,
    C_SAPOOMethodException,
    C_SAPOOAttributeLeaf,
    C_SAPOOAttribute,
    C_SAPOOEventLeaf,
    C_SAPOOEvent,
    C_SAPOOEventParameterLeaf,
    C_SAPOOEventParameter,
    C_SAPOOFunctionGroup,
    C_SAPOOFunctionModule,
    C_SAPOOFunctionModuleLeaf,
    C_SAPOOFunctionGroupInclude,
    C_SAPOOFunctionGroupIncludeLeaf,
    C_SAPOOProgram,
    C_SAPOOProgramText,
    C_SAPOOProgramTextLeaf
};



// ABAP Type Names
#define k_SAPOOType @"SAPOOType"


// dictionary keys
#define k_SelectedObjectDictKey @"selObjectKey"
#define k_ParentSelectedObjectDictKey @"parentSelObjectKey"
#define k_ABAPClassDictKey @"ABAPClassKey"
#define k_TargetSegue @"targetSegue"


// notification names
#define kOpenSlinkeeRequest @"openSlinkee"
#define kDBPurgeCompleted @"dbPurgeCompleted"
#define kImportLogMsg @"importLogMsg"
#define kDropRHSubview @"dropRHSubview"
#define kLoadABAPClassesRequest @"loadABAPClasses"
#define kABAPTreeNodeSelected @"abapTreeNodeSelected"
#define kABAPShowMethodModal @"showMethodModal"


// ABAP CMPTYPE (component-type)
#define CO_ABAPComponentTypeAttribute @"0"
#define CO_ABAPComponentTypeMethod @"1"
#define CO_ABAPComponentTypeEvent @"2"
#define CO_ABAPComponentTypeType @"3"


// ABAP method category (MTDTYPE)
#define kABAPMethodCategoryMethod0 @"0"
#define kABAPMethodCategoryEventHandlingMethod1 @"1"
#define kABAPMethodCategoryConstructor2 @"2"
#define kABAPMethodCategoryDestructor3 @"3"
#define kABAPMethodCategoryVAGetMethod4 @"4"
#define kABAPMethodCategoryVASetMethod5 @"5"
#define kABAPMethodCategoryABAPUnitTestMethod6 @"6"

#define CO_ABAPMethodCategoryMethod @"Method"
#define CO_APMethodCategoryEventHandlingMethod @"Event handling method"
#define CO_ABAPMethodCategoryConstructor @"Constructor"
#define CO_ABAPMethodCategoryDestructor @"Destructor"
#define CO_ABAPMethodCategoryVAGetMethod @"Get method of virtual attribute"
#define CO_ABAPMethodCategoryVASetMethod @"Set method of virtual attribute"
#define CO_ABAPMethodCategoryABAPUnitTestMethod @"Test method of ABAP Unit"



// ABAP visibility (public/protected/private)
// used in NSValueTransformer
#define kABAPVisbilityPrivate @"0"
#define kABAPVisibilityProtected @"1"
#define kABAPVisibilityPublic @"2"

#define CO_ABAPVisibilityPrivate @"Private"
#define CO_ABAPVisibilityProtected @"Protected"
#define CO_ABAPVisibilityPublic @"Public"


// ABAP level (static/instance) transformer (MTDDECLTYP)
#define kABAPLevelInstance @"0"
#define kABAPLevelStatic @"1"

#define CO_ABAPLevelStatic @"Static"
#define CO_ABAPLevelInstance @"Instance"


// ABAP parameter passing type ((method)parpastyp) transformer
#define kABAPPassByValue @"0"
#define kABAPPassByRef @"1"

#define CO_ABAPPassByValue "Pass-By-Value"
#define CO_ABAPPassByRef "Pass-By-Ref"


// ABAP parameter typing definition (TYPTYPE)
#define k0LIKE @"0"
#define k1TYPE @"1"
#define k2TYPEOBJ @"2"
#define k3TYPEREFTO @"3"
#define k4UNDEF @"4"       // use TYPE
#define k5BOXED @"5"

#define CO_0LIKE @"LIKE"
#define CO_1TYPE @"TYPE"
#define CO_2TYPEOBJ @"TYPE"
#define CO_3TYPEREFTO @"TYPE-REF-TO"
#define CO_4UNDEF @"TYPE"       // use TYPE
#define CO_5BOXED @"TYPE...BOXED"


// ABAP parameter declaration type (PARDECLTYP)
#define k0Importing @"0"
#define k1Exporting @"1"
#define k2Changing @"2"
#define k3Returning @"3"
// fm only
#define k98Exception @"98"
#define k99Tables @"99"

#define CO_0Importing @"Imp"
#define CO_1Exporting @"Exp"
#define CO_2Changing @"Chg"
#define CO_3Returning @"Ret"
// fm only
#define CO_98Exception @"EX"
#define CO_99Tables @"Tbl"


// ABAP class attribute declaration level (ATTDECLTYP)
#define k0InstanceAttribute @"0"
#define k1StaticAttribute @"1"
#define k2ConstantAttribute @"2"

#define CO_0InstanceAttr @"Instance Attribute"
#define CO_1StaticAttr @"Static Attribute"
#define CO_2ConstantAttr @"Constant"


// ABAP event declaration level (EVTDECLTYP)
#define k0InstanceEvent @"0"
#define k1StaticEvent @"1"

#define CO_0InstanceEvt @"Instance Event"
#define CO_1StaticEvt @"Static Event"


// ABAP event category (BCEVTCAT)
#define k0CreateEvtCategory @"0"
#define k1ChangeEvtCategory @"1"
#define k2DeleteEvtCategory @"2"
#define k3MiscEvtCategory @"3"

#define CO_0CreateEventCat @"Create"
#define CO_1ChangeEventCat @"Change"
#define CO_2DeleteEventCat @"Delete"
#define CO_3MiscEventCat @"Misc."



// M_ABAPClass properties for NSDictionary access
static NSString *const C_AC_category = @"CATEGORY";
static NSString *const C_AC_unicode = @"UNICODE";
static NSString *const C_AC_changedon = @"CHANGEDON";
static NSString *const C_AC_clsccincl = @"CLSCCINCL";
static NSString *const C_AC_chdanyon = @"CHDANYON";
static NSString *const C_AC_descript = @"DESCRIPT";
static NSString *const C_AC_author = @"AUTHOR";
static NSString *const C_AC_state = @"STATE";
static NSString *const C_AC_uuid = @"UUID";
static NSString *const C_AC_r3release = @"R3RELEASE";
static NSString *const C_AC_exposure = @"EXPOSURE";
static NSString *const C_AC_refclsname = @"REFCLSNAME";
static NSString *const C_AC_createdon = @"CREATEDON";
static NSString *const C_AC_langu = @"LANGU";
static NSString *const C_AC_clsfinal = @"CLSFINAL";
static NSString *const C_AC_version = @"VERSION";
static NSString *const C_AC_risk_level = @"RISK_LEVEL";
static NSString *const C_AC_changedby = @"CHANGEDBY";
static NSString *const C_AC_clsbccat = @"CLSBCCAT";
static NSString *const C_AC_duration_type = @"DURATION_TYPE";
static NSString *const C_AC_fixpt = @"FIXPT";
static NSString *const C_AC_clsname = @"CLSNAME";
static NSString *const C_AC_rel = @"REL";
static NSString *const C_AC_itemName = @"ITEMNAME";

//@dynamic cls_clsattr;
//@dynamic cls_clsevt;
//@dynamic cls_clsmtd;


// M_ABAPClassAttribute properties for NSDictionary access
static NSString *const C_ACA_srcrow1 = @"SRCROW1";
static NSString *const C_ACA_changedon = @"CHANGEDON";
static NSString *const C_ACA_attvalue = @"ATTVALUE";
static NSString *const C_ACA_cmpname = @"CMPNAME";
static NSString *const C_ACA_descript = @"DESCRIPT";
static NSString *const C_ACA_type = @"TYPE";
static NSString *const C_ACA_typtype = @"TYPTYPE";
static NSString *const C_ACA_typesrc_leng = @"TYPESRC_LENG";
static NSString *const C_ACA_author = @"AUTHOR";
static NSString *const C_ACA_attexpvirt = @"ATTEXPVIRT";
static NSString *const C_ACA_state = @"STATE";
static NSString *const C_ACA_attdecltyp = @"ATTDECLTYP";
static NSString *const C_ACA_editorder = @"EDITORDER";
static NSString *const C_ACA_r3release = @"R3RELEASE";
static NSString *const C_ACA_exposure = @"EXPOSURE";
static NSString *const C_ACA_srccolumn2 = @"SRCCOLUMN2";
static NSString *const C_ACA_createdon = @"CREATEDON";
static NSString *const C_ACA_langu = @"LANGU";
static NSString *const C_ACA_version = @"VERSION";
static NSString *const C_ACA_srccolumn1 = @"SRCCOLUMN1";
static NSString *const C_ACA_changedby = @"CHANGEDBY";
static NSString *const C_ACA_clsname = @"CLSNAME";
static NSString *const C_ACA_srcrow2 = @"SRCROW2";
static NSString *const C_ACA_itemName = @"ITEMNAME";
static NSString *const C_ACA_cls_UUID = @"CLS_UUID";
static NSString *const C_ACA_attrdonly = @"ATTRDONLY";
static NSString *const C_ACA_clsattr_cls = @"clsattr_cls";


// M_ABAPClassType properties for NSDictionary access
static NSString *const C_ACT_cmpname = @"CMPNAME";
static NSString *const C_ACT_version = @"VERSION";
static NSString *const C_ACT_langu = @"LANGU";
static NSString *const C_ACT_descript = @"DESCRIPT";
static NSString *const C_ACT_exposure = @"EXPOSURE";
static NSString *const C_ACT_state = @"STATE";
static NSString *const C_ACT_editorder = @"EDITORDER";
static NSString *const C_ACT_typptype = @"TYPTYPE";
static NSString *const C_ACT_srcrow1 = @"SRCROW1";
static NSString *const C_ACT_srccolumn1 = @"SRCCOLUMN1";
static NSString *const C_ACT_srcrow2 = @"SRCROW2";
static NSString *const C_ACT_srccolumn2 = @"SRCCOLUMN2";
static NSString *const C_ACT_typesrc_leng = @"TYPESRC_LENG";
static NSString *const C_ACT_typesrc = @"TYPESRC";



// M_ABAPClassMethod properties for NSDictionary access
static NSString *const C_ACM_cmpname = @"CMPNAME";
static NSString *const C_ACM_bcmtdsyn = @"BCMTDSYN";
static NSString *const C_ACM_mtddecltyp = @"MTDDECLTYP";
static NSString *const C_ACM_author = @"AUTHOR";
static NSString *const C_ACM_bcmtdcat = @"BCMTDCAT";
static NSString *const C_ACM_state = @"STATE";
static NSString *const C_ACM_langu = @"LANGU";
static NSString *const C_ACM_r3release = @"R3RELEASE";
static NSString *const C_ACM_exposure = @"EXPOSURE";
static NSString *const C_ACM_changedon = @"CHANGEDON";
static NSString *const C_ACM_createdon = @"CREATEDON";
static NSString *const C_ACM_version = @"VERSION";
static NSString *const C_ACM_dispid = @"DISPID";
static NSString *const C_ACM_editorder = @"EDITORDER";
static NSString *const C_ACM_mtdtype = @"MTDTYPE";
static NSString *const C_ACM_descript = @"DESCRIPT";
static NSString *const C_ACM_clsname = @"CLSNAME";
static NSString *const C_ACM_itemName = @"ITEMNAME";
static NSString *const C_ACM_sourcecode = @"SOURCECODE";
static NSString *const C_ACM_cls_UUID = @"CLS_UUID";
static NSString *const C_ACM_mtd_UUID = @"MTD_UUID";
static NSString *const C_ACM_cpdname = @"CPDNAME";

// @dynamic clsmtd_cls;
// @dynamic clsmtd_clsmtdparam;
// @dynamic clsmtd_clsmtdex;



// M_ABAPClassMethodRedef properties for NSDictionary access
static NSString *const C_ACMR_clsname = @"CLSNAME";
static NSString *const C_ACMR_refclsname = @"REFCLSNAME";
static NSString *const C_ACMR_version = @"VERSION";
static NSString *const C_ACMR_mtdname = @"MTDNAME";
static NSString *const C_ACMR_exposure = @"EXPOSURE";
//@dynaminc  *clsmtdrdef_cls;



// M_ABAPClassMethodParameters properties for NSDictionary access
static NSString *const C_ACMP_tableof = @"TABLEOF";
static NSString *const C_ACMP_paroptionl = @"PAROPTIONL";
static NSString *const C_ACMP_parvalue = @"PARVALUE";
static NSString *const C_ACMP_cmpname = @"CMPNAME";
static NSString *const C_ACMP_parpastyp = @"PARPASSTYP";
static NSString *const C_ACMP_author = @"AUTHOR";
static NSString *const C_ACMP_cmptype = @"CMPTYPE";
static NSString *const C_ACMP_langu = @"LANGU";
static NSString *const C_ACMP_sconame = @"SCONAME";
static NSString *const C_ACMP_pardecltyp = @"PARDECLTYP";
static NSString *const C_ACMP_changedon = @"CHANGEDON";
static NSString *const C_ACMP_createdon = @"CREATEDON";
static NSString *const C_ACMP_version = @"VERSION";
static NSString *const C_ACMP_dispid = @"DISPID";
static NSString *const C_ACMP_editorder = @"EDITORDER";
static NSString *const C_ACMP_mtdtype = @"MTDTYPE";
static NSString *const C_ACMP_descript = @"DESCRIPT";
static NSString *const C_ACMP_clsname = @"CLSNAME";
static NSString *const C_ACMP_typtype = @"TYPTYPE";
static NSString *const C_ACMP_type = @"TYPE";
static NSString *const C_ACMP_itemName = @"ITEMNAME";
static NSString *const C_ACMP_mtd_UUID = @"MTD_UUID";

// @dynamic clsmtdparam_clsmtd;



// M_ABAPClassMethodException properties for NSDictionary access
static NSString *const C_ACME_cmpname = @"CMPNAME";
static NSString *const C_ACME_editorder = @"EDITORDER";
static NSString *const C_ACME_changedon = @"CHANGEDON";
static NSString *const C_ACME_clsname = @"CLSNAME";
static NSString *const C_ACME_mtdtype = @"MTDTYPE";
static NSString *const C_ACME_descript = @"DESCRIPT";
static NSString *const C_ACME_langu = @"LANGU";
static NSString *const C_ACME_createdon = @"CREATEDON";
static NSString *const C_ACME_author = @"AUTHOR";
static NSString *const C_ACME_version = @"VERSION";
static NSString *const C_ACME_sconame = @"SCONAME";
static NSString *const C_ACME_itemName = @"ITEMNAME";
static NSString *const C_ACME_mtd_UUID = @"MTD_UUID";

// @dynamic clsmtdex_mtd;


// M_ABAPClassEvent properties for NSDictionary access
static NSString *const C_ACE_refcmpname = @"REFCMPNAME";
static NSString *const C_ACE_refclsname = @"REFCLSNAME";
static NSString *const C_ACE_cmpname = @"CMPNAME";
static NSString *const C_ACE_editorder = @"EDITORDER";
static NSString *const C_ACE_state = @"STATE";
static NSString *const C_ACE_clsname = @"CLSNAME";
static NSString *const C_ACE_descript = @"DESCRIPT";
static NSString *const C_ACE_langu = @"LANGU";
static NSString *const C_ACE_bcevtcat = @"BCEVTCAT";
static NSString *const C_ACE_evtdecltyp = @"EVTDECLTYP";
static NSString *const C_ACE_version = @"VERSION";
static NSString *const C_ACE_exposure = @"EXPOSURE";
static NSString *const C_ACE_itemName = @"ITEMNAME";
static NSString *const C_ACE_cls_UUID = @"CLS_UUID";

// @dynamic clsevt_cls;
// @dynamic clsevt_clsevtparam;



// M_ABAPClassEventParameter for NSDictionary access
static NSString *const C_ACEP_parvalue = @"PARVALUE";
static NSString *const C_ACEP_paroptionl = @"PAROPTIONL";
static NSString *const C_ACEP_cmpname = @"CMPNAME";
static NSString *const C_ACEP_parpasstyp = @"PARPASSTYP";
static NSString *const C_ACEP_cmptype = @"CMPTYPE";
static NSString *const C_ACEP_langu = @"LANGU";
static NSString *const C_ACEP_sconame = @"SCONAME";
static NSString *const C_ACEP_version = @"VERSION";
static NSString *const C_ACEP_dispid = @"DISPID";
static NSString *const C_ACEP_editorder = @"EDITORDER";
static NSString *const C_ACEP_mtdtype = @"MTDTYPE";
static NSString *const C_ACEP_descript = @"DESCRIPT";
static NSString *const C_ACEP_clsname = @"CLSNAME";
static NSString *const C_ACEP_typtype = @"TYPTYPE";
static NSString *const C_ACEP_type = @"TYPE";
static NSString *const C_ACEP_itemName = @"ITEMNAME";
static NSString *const C_ACEP_evt_UUID = @"EVT_UUID";

// @dynamic clsevtparam_clsevt;


static int const C_ABAP_UNDF = (int)-1;
static int const C_ABAP_CLAS = (int)0;
static int const C_ABAP_FUGR = (int)1;
static int const C_ABAP_PROG = (int)2;

// FUGR tags of interest (parser)
static NSString *const C_FUGR_fugr = @"FUGR";
static NSString *const C_FUGR_mainprogram = @"mainprogram";
static NSString *const C_FUGR_source = @"source";
static NSString *const C_FUGR_include = @"include";
static NSString *const C_FUGR_include_source = @"include_source";
static NSString *const C_FUGR_functionmodule = @"functionmodule";
static NSString *const C_FUGR_paraImporting = @"paraImporting";
static NSString *const C_FUGR_paraExporting = @"paraExporting";
static NSString *const C_FUGR_paraChanging = @"paraChanging";     // verify
static NSString *const C_FUGR_paraExceptions = @"paraExceptions";
static NSString *const C_FUGR_paraTables = @"paraTables";
static NSString *const C_FUGR_paraDocumentation = @"paraDocumentation";
static NSString *const C_FUGR_fm_source = @"fm_source";
static NSString *const C_FUGR_fm_source_new =@"fm_source_new";


// M_ABAPFugr keys
static NSString *const C_AFG_area = @"AREA";
static NSString *const C_AFG_areat = @"AREAT";
static NSString *const C_AFG_fugr_uuid = @"FUGR_UUID";
static NSString *const C_AFG_name = @"NAME";
static NSString *const C_AFG_varcl = @"VARCL";
static NSString *const C_AFG_dbapl = @"DBAPL";
static NSString *const C_AFG_dbna = @"DBNA";
static NSString *const C_AFG_subc = @"SUBC";
static NSString *const C_AFG_appl = @"APPL";
static NSString *const C_AFG_cnam = @"CNAM";
static NSString *const C_AFG_cdat = @"CDAT";
static NSString *const C_AFG_unam = @"UNAM";
static NSString *const C_AFG_udat = @"UDAT";
static NSString *const C_AFG_vern = @"VERN";
static NSString *const C_AFG_rmand = @"RMAND";
static NSString *const C_AFG_rload = @"RLOAD";
static NSString *const C_AFG_fixpt = @"FIXPT";
static NSString *const C_AFG_sdate = @"SDATE";
static NSString *const C_AFG_stime = @"STIME";
static NSString *const C_AFG_itime = @"ITIME";
static NSString *const C_AFG_idate = @"IDATE";
static NSString *const C_AFG_ldbname = @"LDBNAME";
static NSString *const C_AFG_uccheck = @"UCCHECK";
static NSString *const C_AFG_source = @"SOURCE";
// @dynamic fg_fgincl;



// M_ABAPFugrIncl keys
static NSString *const C_AFGI_fugr_uuid = @"FUGR_UUID";
static NSString *const C_AFGI_incl_uuid = @"INCL_UUID";
static NSString *const C_AFGI_name = @"NAME";
static NSString *const C_AFGI_varcl = @"VARCL";
static NSString *const C_AFGI_subc = @"SUBC";
static NSString *const C_AFGI_appl = @"APPL";
static NSString *const C_AFGI_cnam = @"CNAM";
static NSString *const C_AFGI_cdat = @"CDAT";
static NSString *const C_AFGI_unam = @"UNAM";
static NSString *const C_AFGI_udat = @"UDAT";
static NSString *const C_AFGI_vern = @"VERN";
static NSString *const C_AFGI_rmand = @"RMAND";
static NSString *const C_AFGI_rload = @"RLOAD";
static NSString *const C_AFGI_sdate = @"SDATE";
static NSString *const C_AFGI_idate = @"IDATE";
static NSString *const C_AFGI_itime = @"ITIME";
static NSString *const C_AFGI_uccheck = @"UCCHECK";
static NSString *const C_AFGI_include_source = @"INCLUDE_SOURCE";
// @dynamic fgincl_fg;



// M_ABAPFugrFM keys
static NSString *const C_AFM_fugr_uuid = @"FUGR_UUID";
static NSString *const C_AFM_fm_uuid = @"FM_UUID";
static NSString *const C_AFM_name = @"NAME";
static NSString *const C_AFM_stext = @"STEXT";
static NSString *const C_AFM_fm_source = @"FM_SOURCE";
// @dynamic fm_fmp;
// @dynamic fm_fg;



// M_ABAPFugrFMParameter Keys
static NSString *const C_AFMP_fm_uuid = @"FM_UUID";
static NSString *const C_AFMP_direction = @"DIRECTION";   // determined
static NSString *const C_AFMP_typ = @"TYP";
static NSString *const C_AFMP_parameter = @"PARAMETER";   // also exception
static NSString *const C_AFMP_exception = @"EXCEPTION";   // used only to populate parameter
static NSString *const C_AFMP_kind = @"KIND";
static NSString *const C_AFMP_stext = @"STEXT";
static NSString *const C_AFMP_index = @"INDEX";
static NSString *const C_AFMP_optional = @"OPTIONAL";
static NSString *const C_AFMP_reference = @"REFERENCE";
// @dynamic fmp_dm;




// PROG tags of interest (parser)
static NSString *const C_PROG_PROG = @"PROG";
static NSString *const C_PROG_textElement = @"textElement";
static NSString *const C_PROG_source = @"source";

// M_ABAPProgram Keys
static NSString *const C_P_prog_uuid = @"PROG_UUID";
static NSString *const C_P_name = @"NAME";
static NSString *const C_P_varcl = @"VARCL";
static NSString *const C_P_subc = @"SUBC";
static NSString *const C_P_cnam = @"CNAM";
static NSString *const C_P_cdat = @"CDAT";
static NSString *const C_P_unam = @"UNAM";
static NSString *const C_P_udat = @"UDAT";
static NSString *const C_P_vern = @"VERN";
static NSString *const C_P_rstat = @"RSTAT";
static NSString *const C_P_rmand = @"RMAND";
static NSString *const C_P_rload = @"RLOAD";
static NSString *const C_P_fixpt = @"FIXPT";
static NSString *const C_P_sdate = @"SDATE";
static NSString *const C_P_stime = @"STIME";
static NSString *const C_P_idate = @"IDATE";
static NSString *const C_P_itime = @"ITIMER";
static NSString *const C_P_uccheck = @"UCCHECK";
static NSString *const C_P_source = @"SOURCE";
// @dynamic p_pt;



// M_ABAPProgramText Keys
static NSString *const C_PT_prog_uuid = @"PROG_UUID";
static NSString *const C_PT_iid = @"ID";         // note double-i
static NSString *const C_PT_key = @"KEY";
static NSString *const C_PT_entry = @"ENTRY";
static NSString *const C_PT_length = @"LENGTH";
// @dynamic pt_p;



// XML parser dictionary keys
static NSString *const C_arrayMtdParamsKey = @"arMethodParamsKey";
static NSString *const C_stringMtdSourceKey = @"strMethodSourceKey";

static NSString *const C_arrayEvtParamsKey = @"arEventParamsKey";
static NSString *const C_arrayMtdExcptnsKey = @"arMethodExcptnsKey";

static NSString *const C_arrayFMParamsKey = @"arFMParamsKey";
static NSString *const C_arrayFMDocuKey = @"arFMDocuKey";

static NSString *const C_arrayProgTextsKey = @"arProgTextsKey";

// ViewController NSComboBox identifiers
static NSString *const C_NSCB_ObjSel = @"comboObjectSelection";
static NSString *const C_NSCB_SortSel = @"comboSortSelection";

// Object selection values corresponding to the
// NSComboBox
static NSString *const C_ClassInterfaces_value = @"Classes / Interfaces";
static NSString *const C_FunctionGroups_value = @"Function Groups";
static NSString *const C_Programs_value = @"Programs";
static NSString *const C_Import_SAPLinkFile = @"Import SAPLink File";

// object sorting preference corresponding to the NSComboBox
static NSString *const C_AtoZ = @"Sort A...Z";
static NSString *const C_ZtoA = @"Sort Z...A";

typedef NS_ENUM(int,SAPABAPType)
{
    C_SAPABAPType_CLAS,
    C_SAPABAPType_FUGR,
    C_SAPABAPType_PROG
};



#pragma mark - RIGHT SIDE defs
static NSString *const C_selectedNode = @"selectedNode";


#endif
