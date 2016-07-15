//
//  VC_ABAPFugrTOPINCL_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-19.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_ABAPFugrTOPINCL_Tab.h"

@interface VC_ABAPFugrTOPINCL_Tab ()

@end

@implementation VC_ABAPFugrTOPINCL_Tab


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
    
    _txtview_topsource.string = _fgTopInclude.include_source;
    
    
    _txtview_topsource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_fgTopInclude include_source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
        
        [_txtview_topsource insertText:as replacementRange:[_txtview_topsource selectedRange]];
        // [_txtview_topsource insertText:as];
    }
    
    [[_txtview_topsource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    _txtview_topsource.editable = NO;
    [_txtview_topsource scrollToBeginningOfDocument:self];
}

@end
