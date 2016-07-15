//
//  VC_ABAPClass_Tab.m
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

#import "VC_ABAPClass_Tab.h"
#import "M_ABAPClass.h"
#import "ABAPBOOLTransformer.h"

@interface VC_ABAPClass_Tab ()

@end

@implementation VC_ABAPClass_Tab

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
        _abapClass = [_treeNode moEntity];
    }

    _txt_clsname.stringValue = [_abapClass clsname];

    // refclsname may be empty
    // check for nil explicitly to
    // suppress assertion failure for
    // nil assigment.
    @try
    {
        if([_abapClass refclsname] != nil)
        {
            _txt_refclsname.stringValue = [_abapClass refclsname];
        }
    }
    @catch(NSException *e)
    { /* do nothing*/ }
    
        
    // descript
    @try
    {
        if([_abapClass descript] != nil)
        {
            _txt_descript.stringValue = [_abapClass descript];
        }
    }
    @catch(NSException *e)
    { /* do nothing*/ }
    
        
    // author
    @try
    {
        if([_abapClass author] != nil)
        {
            _txt_author.stringValue = [_abapClass author];
        }
    }
    @catch(NSException *e)
    { /* do nothing*/  }
    
    
    // changedby
    @try
    {
        if([_abapClass changedby] != nil)
        {
            _txt_changedby.stringValue = [_abapClass changedby];
        }
    }
    @catch(NSException *e)
    { /* do nothing*/  }
    
    
    // r3release
    @try
    {
        if([_abapClass r3release] != nil)
        {
            _txt_rel.stringValue = [_abapClass r3release];
        }
    }
    @catch(NSException *e)
    { /* do nothing*/  }
    
    
    
    // version
    @try
    {
        if([_abapClass version] != nil)
        {
            _txt_version.stringValue = [_abapClass version];
        }
    }
    @catch(NSException *e)
    { /* do nothing*/  }
    


    // langu
    @try
    {
        if([_abapClass langu] != nil)
        {
            _txt_langu.stringValue = [_abapClass langu];
        }
    }
    @catch(NSException *e)
    { /* do nothing*/  }

    
    // fixpt
    if([_abapClass fixpt] != nil)
    {
        ABAPBOOLTransformer *abt = [[ABAPBOOLTransformer alloc]init];
        [_chkboxFixpt setState:(NSInteger)[abt transformedValue:[_abapClass fixpt]]];
    }
    else
    {
        [_chkboxFixpt setState:NSOffState];
    }
    
    
    // clsfinal
    if([_abapClass clsfinal] != nil)
    {
        ABAPBOOLTransformer *abt = [[ABAPBOOLTransformer alloc]init];
        [_chkbox_clsfinal setState:(NSInteger)[abt transformedValue:[_abapClass clsfinal]]];
    }
    else
    {
        [_chkbox_clsfinal setState:NSOffState];
    }
    
    
    // unicode
    if([_abapClass unicode] != nil)
    {
        ABAPBOOLTransformer *abt = [[ABAPBOOLTransformer alloc]init];
        [_chkbox_unicode setState:(NSInteger)[abt transformedValue:[_abapClass unicode]]];
    }
    else
    {
        [_chkbox_unicode setState:NSOffState];
    }
    
    
    
    // createdon date
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyyMMdd"];
    NSDate *dt = [df dateFromString:[_abapClass createdon]];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString *tmpDate = [df stringFromDate:dt];
    _dp_createdon.dateValue = [df dateFromString:tmpDate];
    
    
    // changed on
    df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyyMMdd"];
    dt = [df dateFromString:[_abapClass changedon]];
    [df setDateFormat:@"yyyy-MM-dd"];
    tmpDate = [df stringFromDate:dt];
    _dp_changedon.dateValue = [df dateFromString:tmpDate];
    
}

@end
