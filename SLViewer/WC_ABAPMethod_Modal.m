//
//  WC_ABAPMethod_Modal.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-13.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

#import "WC_ABAPMethod_Modal.h"


@interface WC_ABAPMethod_Modal ()

@end

@implementation WC_ABAPMethod_Modal


-(instancetype)initWithDict:(NSDictionary*)d
{
    self = [super initWithWindowNibName:@"WC_ABAPMethod_Modal"];
    
    _abapClassMethod = [d valueForKey:@"abapClassMethod"];

    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayMethodParameters = [[NSArray alloc]initWithArray:[[_abapClassMethod clsmtd_clsmtdparam] sortedArrayUsingDescriptors:arraySD]];
    for(M_ABAPClassMethodParameter *a in _arrayMethodParameters)
    {
        DLog(@"%@",a.sconame);
    }
    
    return self;
}

-(instancetype)initWithABAPClassMethod:(M_ABAPClassMethod *)acm
{
    self = [super initWithWindowNibName:@"WC_ABAPMethod_Modal"];
    
    _abapClassMethod = acm;
    
    // get the parameters ready for the NSTableView and NSArrayController binding
    NSArray *arraySD = [[NSArray alloc]initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"editorder" ascending:YES], nil];
    _arrayMethodParameters = [[NSArray alloc]initWithArray:[[_abapClassMethod clsmtd_clsmtdparam] sortedArrayUsingDescriptors:arraySD]];
    for(M_ABAPClassMethodParameter *a in _arrayMethodParameters)
    {
        DLog(@"%@",a.sconame);
    }
    
    return self;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set the method name and the method body
    _txt_cmpname.stringValue = [_abapClassMethod cmpname];
    _txt_cmpname.editable = NO;
    
    //_txtview_source.string = [_abapClassMethod sourcecode];
    
    _txtview_source.editable = YES;
    _codeFormatUtil = [[ABAPCodeFormatUtil alloc]init];
    
    // create an array object for each source line
    NSArray *arraySourceLines = [[_abapClassMethod sourcecode]componentsSeparatedByString:@"\n"];
    for(NSMutableString *s in arraySourceLines)
    {
        // add the /n back to the line
        NSString *correctedSourceLine = [NSString stringWithFormat:@"%@\n",s];
        NSAttributedString *as = [_codeFormatUtil formatCommentInSourceString:correctedSourceLine];
#pragma mark - 10.11 update
        [_txtview_source insertText:as replacementRange:[_txtview_source selectedRange]];
        // [_txtview_source insertText:as];
#pragma mark - 10.11 update end
    }
    
    [[_txtview_source textStorage] setFont:[NSFont fontWithName:@"Menlo" size:12]];
    _txtview_source.editable = NO;
    [_txtview_source scrollToBeginningOfDocument:self];
    
    
    
    if([[_abapClassMethod mtddecltyp] isEqualToString:@"1"])
    {
        [self.window setTitle:[NSString stringWithFormat:@"Method  %@=>%@",[_abapClassMethod clsname],[_abapClassMethod cmpname]]];
    }
    else
    {
        [self.window setTitle:[NSString stringWithFormat:@"Method  %@->%@",[_abapClassMethod clsname],[_abapClassMethod cmpname]]];
    }
}



@end
