//
//  WC_ABAPFugrFM_Modal.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-18.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "WC_ABAPFugrFM_Modal.h"
#import "M_ABAPFugrFMParameter.h"


@interface WC_ABAPFugrFM_Modal ()

@end

@implementation WC_ABAPFugrFM_Modal

-(instancetype)initWithDict:(NSDictionary*)d
{
    self = [super initWithWindowNibName:@"WC_ABAPFugrFM_Modal"];
    
    _functionModule = [d valueForKey:@"abapFunctionModule"];
    DLog(@"%@",_functionModule);
    
    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES], nil];
    _arrayFMParameters = [[NSArray alloc]initWithArray:[[_functionModule fm_fmp] sortedArrayUsingDescriptors:arraySD]];
    
    return self;
}



- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set the method name and the method body
    _txt_name.stringValue = [_functionModule name];
    _txt_name.editable = NO;
    
    _txtview_fmSource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_functionModule fm_source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
        
#pragma mark - 10.11 update
        //[_txtview_fmSource insertText:as];
        [_txtview_fmSource insertText:as replacementRange:[_txtview_fmSource selectedRange]];
#pragma mark - 10.00 udpate end
    }
    
    [[_txtview_fmSource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    
    _txtview_fmSource.editable = NO;
    [_txtview_fmSource scrollToBeginningOfDocument:self];
    [self.window setTitle:[NSString stringWithFormat:@"Function Module  %@",[_functionModule name]]];
}




@end
