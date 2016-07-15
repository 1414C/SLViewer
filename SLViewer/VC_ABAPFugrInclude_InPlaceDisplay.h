//
//  VC_ABAPFugrInclude_InPlaceDisplay.h
//  SLViewer
//
//  Created by stephen macleod on 2015-05-04.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugrIncl.h"
#import "ABAPCodeFormatUtil.h"

@interface VC_ABAPFugrInclude_InPlaceDisplay : NSViewController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong,nonatomic) M_ABAPFugrIncl *fgTopInclude;
@property (strong) IBOutlet NSTextView *txtViewInclSource;



@end
