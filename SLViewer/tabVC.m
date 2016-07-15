//
//  tabVC.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-09.
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

#import "tabVC.h"
#import "VC_ABAPClass_Tab.h"
#import "VC_ABAPClassMethod_Tab.h"
#import "VC_ABAPClassEvent_Tab.h"
#import "VC_ABAPClassAttributes_Tab.h"
#import "VC_ABAPClassType_Tab.h"
#import "ABAPTreeNode.h"
#import "M_ABAPClass.h"
#import "M_ABAPFugr.h"
#import "M_ABAPFugrFM.h"
#import "M_ABAPProgram.h"
#import "VC_ABAPFugr_Tab.h"
#import "VC_ABAPFugrFM_Tab.h"
#import "VC_ABAPFugrTOPINCL_Tab.h"
#import "VC_ABAPFugr_Includes.h"
#import "VC_ABAPProgram_Tab.h"
#import "VC_ABAPClassMethod_InPlaceDisplay.h"
#import "VC_ABAPFugrFM_InPlaceDisplay.h"
#import "VC_ABAPFugrInclude_InPlaceDisplay.h"




@interface tabVC ()

@end

@implementation tabVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set a listener for NSOutlineView selection
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(selectionNotificationReceived:) name:kABAPTreeNodeSelected object:nil];
    
    
    // fired for item selection in outline view
    // via notification recieved in ABAPDetailController.
    // the notification.userInfo is forwarded via the
    // embedSegue to this view controller.
    [self setTabStyle:NSTabViewControllerTabStyleUnspecified];
    for(NSTabViewItem *ti in self.tabViewItems)
    {
        DLog(@"%@",ti);
        DLog(@"%@",ti.viewController.view.identifier);
    }
}


// cleanup between selections
-(void)removeAllTabViewItems
{
    // for now, always remove all tabs
    // with the exception of the default
    for(NSTabViewItem *ti in self.tabViewItems)
    {
        DLog(@"%@",ti);
        DLog(@"%@",ti.viewController.view.identifier);
        if(![ti.viewController.view.identifier isEqualToString:@"Default_Tab"])
        {
            [self removeTabViewItem:ti];
        }
    }
}

#pragma mark - notification reception from outlineView
-(void)selectionNotificationReceived:(NSNotification*)notification
{
    
    // DLog(@"notification.userinfo: %@",notification.userInfo);
    ABAPTreeNode *tn = [notification.userInfo valueForKey:C_selectedNode];
    DLog(@"tn.itemName:%@",tn.itemName);
    DLog(@"tn.descript:%@",tn.descript);
    DLog(@"tn.index:%@",tn.index);
    DLog(@"tn.SAPObjType:%d",tn.sapootype);
    DLog(@"tn.moEntity:%@",tn.moEntity);

    
    switch (tn.sapootype)
    {
        case C_SAPOOClass:
            {
                // load all tabs and select class properties tab
                [self removeAllTabViewItems];
                M_ABAPClass *abapClass = [tn moEntity];
                [self showABAPClass:abapClass withActiveTabIdentifier:kClassPropertiesTab];
            }
            break;
            
        case C_SAPOOMethodLeaf:
            {
                // load all tabs and select methods tab
                DLog(@"Method Leaf node selected");
                [self removeAllTabViewItems];
                ABAPTreeNode *parentNode = (ABAPTreeNode*)[tn parentNode];
                M_ABAPClass *abapClass = [parentNode moEntity];
                __unused VC_ABAPClassMethod_Tab *vc = [self showABAPClass:abapClass withActiveTabIdentifier:kClassMethodsTab];
            }
            break;
            
        case C_SAPOOMethod:
            {
                // show only method in single tab without showing tab
                [self removeAllTabViewItems];
                
                // SMACLEOD - 2016-07-13
                // the next three LOC are a kludgy vestige of the original design
                // where a call to view a method launched the three tab-view containing
                // the Properties, Attributes and Methods.
                // In order to get the view(Controller) hierarchy setup correctly we run
                // the old way first, then dismiss.  It is crazy messy, but I am kind of
                // done with this code - so if you want to fix it....  :)
                M_ABAPClass *abapClass = [(M_ABAPClassMethod*)[tn moEntity]clsmtd_cls];
                [self showABAPClass:abapClass withActiveTabIdentifier:kClassPropertiesTab];
                [self removeAllTabViewItems];
                VC_ABAPClassMethod_InPlaceDisplay *vc = [self showABAPMethod:[tn moEntity]];
                if(vc)
                {
                    // remember that you did this
                    // [vc didSelectABAPClassMethod:[tn moEntity]];
                }
            }
            break;
            
        case C_SAPOOEventLeaf:
            {
                [self removeAllTabViewItems];
                ABAPTreeNode *parentNode = (ABAPTreeNode*)[tn parentNode];
                M_ABAPClass *abapClass = [parentNode moEntity];
                [self showABAPClass:abapClass withActiveTabIdentifier:kClassEventsTab];
            }
            break;
            
        case C_SAPOOEvent:
            {
                [self removeAllTabViewItems];
                M_ABAPClass *abapClass = [(M_ABAPClassEvent*)[tn moEntity]clsevt_cls];
                [self showABAPClass:abapClass withActiveTabIdentifier:kClassEventsTab];
            }
            break;
            
        case C_SAPOOAttributeLeaf:
            {
                [self removeAllTabViewItems];
                ABAPTreeNode *parentNode = (ABAPTreeNode*)[tn parentNode];
                M_ABAPClass *abapClass = [parentNode moEntity];
                [self showABAPClass:abapClass withActiveTabIdentifier:kClassAttributesTab];
            }
            DLog(@"Attribute Leaf node selected");
            break;
            
        case C_SAPOOAttribute:
            {
                [self removeAllTabViewItems];
                M_ABAPClass *abapClass = [(M_ABAPClassAttribute*)[tn moEntity]clsattr_cls];
                [self showABAPClass:abapClass withActiveTabIdentifier:kClassAttributesTab];
            }
            break;
            
            
        case C_SAPOOFunctionGroup:
            {
                [self removeAllTabViewItems];
                M_ABAPFugr *abapFugr = [tn moEntity];
                DLog(@"%@",[abapFugr source]);
                [self showABAPFugr:abapFugr withActiveTabIdentifier:kFugrPropertiesTab];
            }
            
            break;
            
            
        case C_SAPOOFunctionModuleLeaf:
        {
            // load all tabs and select methods tab
            DLog(@"Function Module Leaf node selected");
            [self removeAllTabViewItems];
            ABAPTreeNode *parentNode = (ABAPTreeNode*)[tn parentNode];
            M_ABAPFugr *abapFugr = [parentNode moEntity];
            __unused VC_ABAPFugrFM_Tab *vc = [self showABAPFugr:abapFugr withActiveTabIdentifier:kFugrFunctionModulesTab];
        }
            break;
            
            
        case C_SAPOOFunctionModule:
            {
                // SMACLEOD - 2016-07-13
                // the next three LOC are a kludgy vestige of the original design
                // where a call to view a method launched a four tab-view containing
                // the FG properties, global data, includes, and function modules.
                // In order to get the view(Controller) hierarchy setup correctly
                // (yawn) we run the old way first, then dismiss.  It is crazy
                // messy (as mentioned above), but I am kind of done with this code
                // so if you want to fix it have at it!!  :)))
                M_ABAPFugr *abapFugr = [(M_ABAPFugrFM*)[tn moEntity]fm_fg];
                [self showABAPFugr:abapFugr withActiveTabIdentifier:kFugrPropertiesTab];
                [self removeAllTabViewItems];
                
                VC_ABAPFugrFM_InPlaceDisplay *vc = [self showABAPFunctionModule:(M_ABAPFugrFM*)[tn moEntity]];
                DLog(@"Function-module node selected");
                DLog(@"%@",[tn moEntity]);
                if(vc)
                {
                    // remember that you did this
                    // [vc didSelectFunctionModule:[tn moEntity]];
                }
            }
            break;
            
        case C_SAPOOFunctionGroupIncludeLeaf:
            {
                // load all tabs and select methods tab
                DLog(@"Function Group Include Leaf node selected");
                [self removeAllTabViewItems];
                ABAPTreeNode *parentNode = (ABAPTreeNode*)[tn parentNode];
                M_ABAPFugr *abapFugr = [parentNode moEntity];
                __unused VC_ABAPFugrFM_Tab *vc = [self showABAPFugr:abapFugr withActiveTabIdentifier:kFugrIncludesTab];
            }
            break;
            
        case C_SAPOOFunctionGroupInclude:
            {
                [self removeAllTabViewItems];
                __unused VC_ABAPFugrInclude_InPlaceDisplay *vc = [self showABAPFugrInclude:(M_ABAPFugrIncl*)[tn moEntity]];
            }
            DLog(@"Function Group Include selected");
            break;
            
        case C_SAPOOProgram:
            {
                DLog(@"SE38 program node selected");
                [self removeAllTabViewItems];
                M_ABAPProgram *abapProgram = (M_ABAPProgram*)[tn moEntity];
                __unused VC_ABAPProgram_Tab *vc = [self showABAPProgram:abapProgram];
                
                DLog(@"%@",[abapProgram source]);
            }
            break;
            
        case C_SAPOOProgramText:
            DLog(@"SE38 program text node selected");
            break;
            
            
            
        default:
            break;
    }
    
}



-(id)showABAPProgram:(M_ABAPProgram*)abapProgram
{
    [self setTabStyle:NSTabViewControllerTabStyleUnspecified];
    NSTabViewItem *tabViewItem = nil;
    VC_ABAPProgram_Tab *vcABAPProgram_Tab = [[VC_ABAPProgram_Tab alloc]init];
    vcABAPProgram_Tab.identifier = kProgTab;
    [vcABAPProgram_Tab setAbapProgram:abapProgram];
    [self addChildViewController:vcABAPProgram_Tab];
    tabViewItem = [self tabViewItemForViewController:vcABAPProgram_Tab];
    [tabViewItem setLabel:@"Program Source"];
    [tabViewItem setIdentifier:kProgTab];
    [self addTabViewItem:tabViewItem];
    
    // remove the default tab
    for(NSTabViewItem *ti in self.tabViewItems)
    {
        DLog(@"%@",ti);
        DLog(@"%@",ti.viewController.view.identifier);
        if([ti.viewController.view.identifier isEqualToString:@"Default_Tab"])
        {
            [self removeTabViewItem:ti];
        }
    }
    
    return vcABAPProgram_Tab;
}



-(id)showABAPFunctionModule:(M_ABAPFugrFM*)fm
{
    [self setTabStyle:NSTabViewControllerTabStyleUnspecified];
    NSTabViewItem *tabViewItem = nil;
    VC_ABAPFugrFM_InPlaceDisplay *vcABAPFugrFMIPTab = [[VC_ABAPFugrFM_InPlaceDisplay alloc]init];
    vcABAPFugrFMIPTab.identifier = kFugrFMIPTab;
    [vcABAPFugrFMIPTab setFunctionModule:fm];
    
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES], nil];
    NSArray *arrayFMParameters = [[NSArray alloc]initWithArray:[[fm fm_fmp] sortedArrayUsingDescriptors:arraySD]];
    [vcABAPFugrFMIPTab setArrayFMParameters:arrayFMParameters];
    
    [self addChildViewController:vcABAPFugrFMIPTab];
    tabViewItem = [self tabViewItemForViewController:vcABAPFugrFMIPTab];
    [tabViewItem setLabel:@"Function Module"];    // not displayed
    [tabViewItem setIdentifier:kFugrFMIPTab];
    [self addTabViewItem:tabViewItem];
    
    return self;
}



-(id)showABAPFugrInclude:(M_ABAPFugrIncl*)fugrIncl
{
    [self setTabStyle:NSTabViewControllerTabStyleUnspecified];
    NSTabViewItem *tabViewItem = nil;
    VC_ABAPFugrInclude_InPlaceDisplay *vcABAPFugrInclIPTab = [[VC_ABAPFugrInclude_InPlaceDisplay alloc]init];
    vcABAPFugrInclIPTab.identifier = kFugrInclIPTab;
    [vcABAPFugrInclIPTab setFgTopInclude:fugrIncl];
    
    [self addChildViewController:vcABAPFugrInclIPTab];
    tabViewItem = [self tabViewItemForViewController:vcABAPFugrInclIPTab];
    [tabViewItem setLabel:@"Function Module Include"];    // not displayed
    [tabViewItem setIdentifier:kFugrInclIPTab];
    [self addTabViewItem:tabViewItem];
    
    return self;
}



-(id)showABAPFugr:(M_ABAPFugr*)afg withActiveTabIdentifier:(NSString*)tabIdentifier
{
    [self setTabStyle:NSTabViewControllerTabStyleSegmentedControlOnTop];
    NSTabViewItem *tabViewItem = nil;
    DLog(@"%@",self.tabViewItems);
    // set the fugr properties tab

    VC_ABAPFugr_Tab *vcABAPFugr_Tab = [[VC_ABAPFugr_Tab alloc]init];
    vcABAPFugr_Tab.identifier = kFugrPropertiesTab;
    [vcABAPFugr_Tab setAbapFugr:afg];
    [self addChildViewController:vcABAPFugr_Tab];
    tabViewItem = [self tabViewItemForViewController:vcABAPFugr_Tab];
    [tabViewItem setLabel:@"Function Group Properties"];
    [tabViewItem setIdentifier:kClassPropertiesTab];
    [self addTabViewItem:tabViewItem];
    
    
    // set the function modules tab
    VC_ABAPFugrFM_Tab *vcABAPFugrFM_Tab = [[VC_ABAPFugrFM_Tab alloc]init];
    [vcABAPFugrFM_Tab setFugrFunctionModules:[afg fg_fm]];
    if([[vcABAPFugrFM_Tab fugrFunctionModules]count] > 0)
    {
        [self addChildViewController:vcABAPFugrFM_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPFugrFM_Tab];
        [tabViewItem setLabel:@"Function Modules"];
        [tabViewItem setIdentifier:kFugrFunctionModulesTab];
        [self addTabViewItem:tabViewItem];
    }
    else
    {
        vcABAPFugrFM_Tab = nil;
    }
    
    
    // set the top include tab (global data)
    NSSet *includeSet = [afg fg_fgincl];
    NSString *topIncludeName = [[NSString alloc]initWithFormat:@"L%@TOP",[afg area]];
    for(M_ABAPFugrIncl *include in includeSet)
    {
        if([[include name]isEqualToString:topIncludeName])
        {
            VC_ABAPFugrTOPINCL_Tab *vcABAPFugrTOPIINCL_Tab = [[VC_ABAPFugrTOPINCL_Tab alloc]init];
            vcABAPFugrTOPIINCL_Tab.fgTopInclude = include;
            [self addChildViewController:vcABAPFugrTOPIINCL_Tab];
            tabViewItem = [self tabViewItemForViewController:vcABAPFugrTOPIINCL_Tab];
            [tabViewItem setLabel:@"Global Data"];
            [tabViewItem setIdentifier:kFugrTopIncludeTab];
            [self addTabViewItem:tabViewItem];
        }
    }
    
    
    // set the includes tab
    VC_ABAPFugr_Includes *vcABAPFugrIncludes = [[VC_ABAPFugr_Includes alloc]init];
    [vcABAPFugrIncludes setFugrIncludes:[afg fg_fgincl]];
    if([[vcABAPFugrIncludes fugrIncludes]count] > 0)
    {
        [self addChildViewController:vcABAPFugrIncludes];
        tabViewItem = [self tabViewItemForViewController:vcABAPFugrIncludes];
        [tabViewItem setLabel:@"Function Group Includes"];
        [tabViewItem setIdentifier:kFugrIncludesTab];
        [self addTabViewItem:tabViewItem];
    }
    else
    {
        vcABAPFugrIncludes = nil;
    }


    
    // remove the default tab
    for(NSTabViewItem *ti in self.tabViewItems)
    {
        DLog(@"%@",ti);
        DLog(@"%@",ti.viewController.view.identifier);
        if([ti.viewController.view.identifier isEqualToString:@"Default_Tab"])
        {
            [self removeTabViewItem:ti];
        }
    }
    
    if([tabIdentifier isEqualToString:kFugrPropertiesTab])
    {
        // always tab index 0
        self.selectedTabViewItemIndex = 0;
        return vcABAPFugr_Tab;
    }
    
    
    if([tabIdentifier isEqualToString:kFugrFunctionModulesTab])
    {
        // always tab index 1
        self.selectedTabViewItemIndex = 1;
        return vcABAPFugrFM_Tab;
    }
    
    
    if([tabIdentifier isEqualToString:kFugrIncludesTab])
    {
        // always last tab index
        self.selectedTabViewItemIndex = [self.tabViewItems count]-1;
        return vcABAPFugrFM_Tab;
    }
    
    return nil;
}





-(id)showABAPMethod:(M_ABAPClassMethod*)am
{
    // probably add the class view here - see showABAPClass:
    [self setTabStyle:NSTabViewControllerTabStyleUnspecified];
    NSTabViewItem *tabViewItem = nil;
    
    VC_ABAPClassMethod_InPlaceDisplay *vcABAPClassMethodIPTab = [[VC_ABAPClassMethod_InPlaceDisplay alloc]init];
    vcABAPClassMethodIPTab.identifier = kClassMethodIPTab;
    [vcABAPClassMethodIPTab setAbapClassMethod:am];
    
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    NSArray *arrayMethodParameters = [[NSArray alloc]initWithArray:[[am clsmtd_clsmtdparam] sortedArrayUsingDescriptors:arraySD]];
    [vcABAPClassMethodIPTab setArrayMethodParameters:arrayMethodParameters];
    
    [self addChildViewController:vcABAPClassMethodIPTab];
    tabViewItem = [self tabViewItemForViewController:vcABAPClassMethodIPTab];
    [tabViewItem setLabel:@"Class Method"];    // not displayed
    [tabViewItem setIdentifier:kClassMethodIPTab];
    [self addTabViewItem:tabViewItem];
    
    return vcABAPClassMethodIPTab;
}


// maybe cleanup NSTabViewController on the way in....
-(id)showABAPClass:(M_ABAPClass*)ac withActiveTabIdentifier:(NSString*)tabIdentifier
{
    [self setTabStyle:NSTabViewControllerTabStyleSegmentedControlOnTop];
    NSTabViewItem *tabViewItem = nil;

    VC_ABAPClass_Tab *vcABAPClass_Tab = [[VC_ABAPClass_Tab alloc]init];
    vcABAPClass_Tab.identifier = @"ABAPClassProperties";
    [vcABAPClass_Tab setAbapClass:ac];
    
    [self addChildViewController:vcABAPClass_Tab];
    tabViewItem = [self tabViewItemForViewController:vcABAPClass_Tab];
    [tabViewItem setLabel:@"Class Properties"];
    [tabViewItem setIdentifier:kClassPropertiesTab];
    [self addTabViewItem:tabViewItem];
    
    // set the class methods tab
    VC_ABAPClassMethod_Tab *vcABAPClassMethod_Tab = [[VC_ABAPClassMethod_Tab alloc]init];
    [vcABAPClassMethod_Tab setClassMethods:[ac cls_clsmtd]];
    if([[vcABAPClassMethod_Tab classMethods]count] > 0)
    {
        [self addChildViewController:vcABAPClassMethod_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassMethod_Tab];
        [tabViewItem setLabel:@"Class Methods"];
        [tabViewItem setIdentifier:kClassMethodsTab];
        [self addTabViewItem:tabViewItem];
        
        if([tabIdentifier isEqualToString:kClassMethodsTab])
        {
            // always tab index 1
            self.selectedTabViewItemIndex = 1;
        }
    }
    else
    {
        vcABAPClassMethod_Tab = nil;
    }
    
    
    // set the class events tab
    VC_ABAPClassEvent_Tab *vcABAPClassEvent_Tab = [[VC_ABAPClassEvent_Tab alloc]init];
    [vcABAPClassEvent_Tab setClassEvents:[ac cls_clsevt]];
    if([[vcABAPClassEvent_Tab classEvents]count] > 0)
    {
        [self addChildViewController:vcABAPClassEvent_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassEvent_Tab];
        [tabViewItem setLabel:@"Class Events"];
        [tabViewItem setIdentifier:kClassEventsTab];
        [self addTabViewItem:tabViewItem];
        
        if([tabIdentifier isEqualToString:kClassEventsTab])
        {
            
            self.selectedTabViewItemIndex = [self.tabViewItems count] - 1;
        }
    }
    else
    {
        vcABAPClassEvent_Tab = nil;
    }
    
    // set the class attributes tab
    VC_ABAPClassAttributes_Tab *vcABAPClassAttributes_Tab = [[VC_ABAPClassAttributes_Tab alloc]init];
    [vcABAPClassAttributes_Tab setClassAttributes:[ac cls_clsattr]];
    if([[vcABAPClassAttributes_Tab classAttributes]count] > 0)
    {
        [self addChildViewController:vcABAPClassAttributes_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassAttributes_Tab];
        [tabViewItem setLabel:@"Class Attributes"];
        [tabViewItem setIdentifier:kClassAttributesTab];
        [self addTabViewItem:tabViewItem];
        
        if([tabIdentifier isEqualToString:kClassAttributesTab])
        {
            
            self.selectedTabViewItemIndex = [self.tabViewItems count] - 1;
        }
        
    }
    else
    {
        vcABAPClassAttributes_Tab = nil;
    }
    
    // set the class types tab
    VC_ABAPClassType_Tab *vcABAPClassTypes_Tab = [[VC_ABAPClassType_Tab alloc]init];
    [vcABAPClassTypes_Tab setClassTypes:[ac cls_clstyp]];
    if([[vcABAPClassTypes_Tab classTypes]count] > 0)
    {
        [self addChildViewController:vcABAPClassTypes_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassTypes_Tab];
        [tabViewItem setLabel:@"Class Types"];
        [tabViewItem setIdentifier:kClassTypesTab];
        [self addTabViewItem:tabViewItem];
        
        if([tabIdentifier isEqualToString:kClassTypesTab])
        {
            
            self.selectedTabViewItemIndex = [self.tabViewItems count] - 1;
        }

    }
    else
    {
        vcABAPClassTypes_Tab = nil;
    }
    
    // for now, always remove all tabs
    // with the exception of the default
    for(NSTabViewItem *ti in self.tabViewItems)
    {
        DLog(@"%@",ti);
        DLog(@"%@",ti.viewController.view.identifier);
        if([ti.viewController.view.identifier isEqualToString:@"Default_Tab"])
        {
            [self removeTabViewItem:ti];
        }
    }
    
    if([tabIdentifier isEqualToString:kClassPropertiesTab])
    {
            self.selectedTabViewItemIndex = 0;
    }
    
    if([tabIdentifier isEqualToString:kClassMethodsTab])
    {
        return vcABAPClassMethod_Tab;
    }
    
    if([tabIdentifier isEqualToString:kClassEventsTab])
    {
        return vcABAPClassEvent_Tab;
    }
    
    return nil;
}


-(void)showClassFromTreeNode:(ABAPTreeNode*)treeNode withActiveTabIdentifier:(NSString*)tabIdentifier
{
    [self setTabStyle:NSTabViewControllerTabStyleSegmentedControlOnTop];
    NSTabViewItem *tabViewItem = nil;
    
    // set the class properties tab
    VC_ABAPClass_Tab *vcABAPClass_Tab = [[VC_ABAPClass_Tab alloc]init];
    vcABAPClass_Tab.identifier = @"ABAPClassProperties";
    [vcABAPClass_Tab setTreeNode:treeNode];
    [self addChildViewController:vcABAPClass_Tab];
    tabViewItem = [self tabViewItemForViewController:vcABAPClass_Tab];
    [tabViewItem setLabel:@"Class Properties"];
    [tabViewItem setIdentifier:kClassPropertiesTab];
    [self addTabViewItem:tabViewItem];
    
    // set the class methods tab
    VC_ABAPClassMethod_Tab *vcABAPClassMethod_Tab = [[VC_ABAPClassMethod_Tab alloc]init];
    [vcABAPClassMethod_Tab setClassMethods:[(M_ABAPClass*)[treeNode moEntity]cls_clsmtd]];
    if([[vcABAPClassMethod_Tab classMethods]count] > 0)
    {
        [self addChildViewController:vcABAPClassMethod_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassMethod_Tab];
        [tabViewItem setLabel:@"Class Methods"];
        [tabViewItem setIdentifier:kClassMethodsTab];
        [self addTabViewItem:tabViewItem];
    }
    else
    {
        vcABAPClassMethod_Tab = nil;
    }
    
    
    // set the class events tab
    VC_ABAPClassEvent_Tab *vcABAPClassEvent_Tab = [[VC_ABAPClassEvent_Tab alloc]init];
    [vcABAPClassEvent_Tab setClassEvents:[(M_ABAPClass*)[treeNode moEntity]cls_clsevt]];
    if([[vcABAPClassEvent_Tab classEvents]count] > 0)
    {
        [self addChildViewController:vcABAPClassEvent_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassEvent_Tab];
        [tabViewItem setLabel:@"Class Events"];
        [tabViewItem setIdentifier:kClassEventsTab];
        [self addTabViewItem:tabViewItem];
    }
    else
    {
        vcABAPClassEvent_Tab = nil;
    }
    
    // set the class attributes tab
    VC_ABAPClassAttributes_Tab *vcABAPClassAttributes_Tab = [[VC_ABAPClassAttributes_Tab alloc]init];
    [vcABAPClassAttributes_Tab setClassAttributes:[(M_ABAPClass*)[treeNode moEntity]cls_clsattr]];
    if([[vcABAPClassAttributes_Tab classAttributes]count] > 0)
    {
        [self addChildViewController:vcABAPClassAttributes_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassAttributes_Tab];
        [tabViewItem setLabel:@"Class Attributes"];
        [tabViewItem setIdentifier:kClassAttributesTab];
        [self addTabViewItem:tabViewItem];
    }
    else
    {
        vcABAPClassAttributes_Tab = nil;
    }
    
    // set the class types tab
    VC_ABAPClassType_Tab *vcABAPClassTypes_Tab = [[VC_ABAPClassType_Tab alloc]init];
    [vcABAPClassTypes_Tab setClassTypes:[(M_ABAPClass*)[treeNode moEntity]cls_clstyp]];
    if([[vcABAPClassTypes_Tab classTypes]count] > 0)
    {
        [self addChildViewController:vcABAPClassTypes_Tab];
        tabViewItem = [self tabViewItemForViewController:vcABAPClassTypes_Tab];
        [tabViewItem setLabel:@"Class Types"];
        [tabViewItem setIdentifier:kClassTypesTab];
        [self addTabViewItem:tabViewItem];
    }
    else
    {
        vcABAPClassTypes_Tab = nil;
    }
    
    // for now, always remove all tabs
    // with the exception of the default
    for(NSTabViewItem *ti in self.tabViewItems)
    {
        DLog(@"%@",ti);
        DLog(@"%@",ti.viewController.view.identifier);
        if([ti.viewController.view.identifier isEqualToString:@"Default_Tab"])
        {
            [self removeTabViewItem:ti];
        }
    }
    
    self.selectedTabViewItemIndex = 1;

}


-(void)showClassMethodsFromTreeNode:(ABAPTreeNode*)treeNode
{
    
}
//typedef NS_ENUM(int,SAPObjType)
//{
//    C_SAPOOClass,
//    C_SAPOOMethodLeaf,
//    C_SAPOOMethod,
//    C_SAPOOMethodParameterLeaf,
//    C_SAPOOMethodParameter,
//    C_SAPOOMethodParameterIMG,
//    C_SAPOOMethodExceptionLeaf,
//    C_SAPOOMethodException,
//    C_SAPOOAttributeLeaf,
//    C_SAPOOAttribute,
//    C_SAPOOEventLeaf,
//    C_SAPOOEvent,
//    C_SAPOOEventParameterLeaf,
//    C_SAPOOEventParameter,
//    C_SAPOOFunctionGroup,
//    C_SAPOOFunctionModule,
//    C_SAPOOFunctionGroupInclude,
//    C_SAPOOProgram,
//    C_SAPOOProgramText
//};

@end
