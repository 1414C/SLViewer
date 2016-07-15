//
//  VC_ABAPFugr_Tab.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-16.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "VC_ABAPFugr_Tab.h"

@interface VC_ABAPFugr_Tab ()

@end

@implementation VC_ABAPFugr_Tab

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor windowBackgroundColor]CGColor]];
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.borderColor = [[NSColor gridColor]CGColor];
    
    // get a typed pointer to the managed object
    // old version used setTreeNode
    // new version uses setAbapClass
    if(_treeNode)
    {
        _abapFugr = [_treeNode moEntity];
    }
    
    _txt_area.stringValue = [_abapFugr area];
    _txt_areat.stringValue = [_abapFugr areat];
    _txt_name.stringValue = [_abapFugr name];
    
    // _txtview_mainprogram.string = [_abapFugr source];
    
    // set editable and create the code formatter
    _txtview_mainprogram.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_abapFugr source]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
#pragma mark - 10.11 update
        [_txtview_mainprogram insertText:as replacementRange:[_txtview_mainprogram selectedRange]];
        // [_txtview_mainprogram insertText:as];
#pragma mark - 10.11 update end
    }
//
    [[_txtview_mainprogram textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    
    _txtview_mainprogram.editable = NO;
    [_txtview_mainprogram scrollToBeginningOfDocument:self];
    
    
    // slinkee files may not contain user info
    @try
    {
        if([_abapFugr cnam])
        {
            _txt_cnam.stringValue = [_abapFugr cnam];
        }
    }
    @catch (NSException *exception)
    { /* do nothing */ }
    
    
    // slinkee files may not contain user info
    @try
    {
        if([_abapFugr unam])
        {
            _txt_unam.stringValue = [_abapFugr unam];
        }
    }
    @catch (NSException *exception)
    { /* do nothing */ }
    
    
    // slinkee files may not contain data info
    @try
    {
        if([_abapFugr cdat])
        {
            NSDateFormatter *df = [[NSDateFormatter alloc]init];
            [df setDateFormat:@"yyyyMMdd"];
            NSDate *dt = [df dateFromString:[_abapFugr cdat]];
            [df setDateFormat:@"yyyy-MM-dd"];
            NSString *tmpDate = [df stringFromDate:dt];
            _dp_cdat.dateValue = [df dateFromString:tmpDate];
        }
    }
    @catch (NSException *exception)
    { /* do nothing */ }
    
    
    
    // slinkee files may not contain data info
    @try
    {
        if([_abapFugr udat])
        {
            NSDateFormatter *df = [[NSDateFormatter alloc]init];
            [df setDateFormat:@"yyyyMMdd"];
            NSDate *dt = [df dateFromString:[_abapFugr udat]];
            [df setDateFormat:@"yyyy-MM-dd"];
            NSString *tmpDate = [df stringFromDate:dt];
            _dp_udat.dateValue = [df dateFromString:tmpDate];
        }
    }
    @catch (NSException *exception)
    { /* do nothing */ }
    
    
    
    // fixpt
    @try
    {
        if([_abapFugr fixpt])
        {
            ABAPBOOLTransformer *abt = [[ABAPBOOLTransformer alloc]init];
            [_chkboxFixpt setState:(NSInteger)[abt transformedValue:[_abapFugr fixpt]]];
        }
        else
        {
            [_chkboxFixpt setState:NSOffState];
        }
    }
    @catch (NSException *exception)
    {
        [_chkboxFixpt setState:NSOffState];
    }
    
}

@end
