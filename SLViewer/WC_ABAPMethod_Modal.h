//
//  WC_ABAPMethod_Modal.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-13.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "M_ABAPClassMethod.h"
#import "M_ABAPClassMethodParameter.h"
#import "ABAPCodeFormatUtil.h"

@interface WC_ABAPMethod_Modal : NSWindowController
{
    ABAPCodeFormatUtil *_codeFormatUtil;
}

@property (strong,nonatomic) M_ABAPClassMethod *abapClassMethod;
@property (strong) IBOutlet NSTextField *txt_cmpname;

@property (strong) IBOutlet NSTextView *txtview_source;

@property (strong) IBOutlet NSArrayController *mtdParamArrayController;
@property (strong) NSArray *arrayMethodParameters;
@property (strong) IBOutlet NSTableView *parameterTableView;

-(instancetype)initWithDict:(NSDictionary*)d;
-(instancetype)initWithABAPClassMethod:(M_ABAPClassMethod*)acm;
@end
