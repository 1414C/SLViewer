//
//  VC_ABAPFugrTOPINCL_Tab.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-19.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugrIncl.h"
#import "ABAPCodeFormatUtil.h"

@interface VC_ABAPFugrTOPINCL_Tab : NSViewController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong,nonatomic) M_ABAPFugrIncl *fgTopInclude;
@property (strong) IBOutlet NSTextView *txtview_topsource;


@end
