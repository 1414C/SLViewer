//
//  WC_ABAPFugrIncludes_Modal.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-20.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPFugrIncl.h"
#import "ABAPCodeFormatUtil.h"

@interface WC_ABAPFugrIncludes_Modal : NSWindowController

{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong,nonatomic) M_ABAPFugrIncl *fugrInclude;

@property (strong,nonatomic) IBOutlet NSTextView *txtview_inclSource;

-(instancetype)initWithDict:(NSDictionary*)d;

@end
