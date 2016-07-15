//
//  WC_ABAPFugrIncludes_Modal.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-20.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "WC_ABAPFugrIncludes_Modal.h"

@interface WC_ABAPFugrIncludes_Modal ()

@end

@implementation WC_ABAPFugrIncludes_Modal


-(instancetype)initWithDict:(NSDictionary*)d
{
    self = [super initWithWindowNibName:@"WC_ABAPFugrIncludes_Modal"];
    
    _fugrInclude = [d valueForKey:@"fugrInclude"];
    DLog(@"%@",_fugrInclude);
    
    return self;
}



- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set the include source
    //_txtview_inclSource.string = [_fugrInclude include_source];
    
    _txtview_inclSource.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_fugrInclude include_source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
#pragma mark - 10.11 update
        [_txtview_inclSource insertText:as replacementRange:[_txtview_inclSource selectedRange]];
        // [_txtview_inclSource insertText:as];
#pragma mark - 10.11 update end
    }
    
    [_txtview_inclSource scrollToBeginningOfDocument:self];
    [[_txtview_inclSource textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    _txtview_inclSource.editable = NO;
    
    [self.window setTitle:[NSString stringWithFormat:@"Function Module Include  %@",[_fugrInclude name]]];
}

@end
