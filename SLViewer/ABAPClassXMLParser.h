//
//  ABAPClassXMLParser.h
//  SimpleXMLParsing
//
//  Created by stephen macleod on 2015-03-11.
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

#import <Foundation/Foundation.h>
#import "ConstantsAndEnums.h"
#import "M_ABAPClass.h"
#import "M_ABAPClassMethod.h"
#import "M_ABAPClassEvent.h"
#import "DataManager.h"
#import "M_ABAPFugr.h"
#import "M_ABAPProgram.h"
#import "M_ABAPClassAttribute.h"


// protocol for calling class
@protocol ABAPXMLClassParserDelegate <NSObject>

// possible that this will send nil
-(void)parserDidFinishWithClass:(M_ABAPClass*)abapClass;
-(void)parserDidFinishWithFugr:(M_ABAPFugr*)abapFugr;
-(void)parserDidFinishWithProgram:(M_ABAPProgram*)abapProgram;
-(void)parserDidFinish;

@end


@interface ABAPClassXMLParser : NSObject <NSXMLParserDelegate>

{
    // anything can use this protocol
    // calling class should set itself
    // as the delegate for its instance of
    // ABAPClassXMLParser.
    // id <ABAPXMLClassParserDelegate> delegate;
    
    
    NSDictionary *dictElements;
    
    NSMutableArray *arSource;
    NSMutableString *strSource;
    NSMutableString *strPublicSectionSource;
    NSMutableString *strProtectedSectionSource;
    NSMutableString *strPrivateSectionSource;
    NSMutableString *strLocalMacroSource;
    NSMutableString *strLocalTypeSource;
    NSMutableString *strLocalImplSource;
    NSMutableString *currentElement;
    
    M_ABAPClassMethod *currentABAPMethod;
    M_ABAPClassEvent *currentABAPEvent;
    M_ABAPClassAttribute *currentAttribute;
    
    // flags to indicate which array
    // to add the <parameter> tag
    // content to.
    BOOL bMethod;
    BOOL bEvent;
    
    int iCurrentObj;
    
    
    // FUGR
    NSMutableString *strFugrSource;    // main program source
    NSMutableDictionary *dictInclude;  // current fugr include
    NSMutableString *strInclSource;    // fugr include source
    NSMutableDictionary *dictFM;       // current FM
    
    // added to dictFM when FM tag closes
    NSMutableArray *arFMParams;        // array of FM parameters and exceptions
    NSMutableArray *arFMParamDocu;     // array of FM parameter and exception documentation
    NSMutableString *strFMSource;      // FM source + FM source (new)
    
    
    // PROG
    NSMutableString *strProgSource;
    NSMutableArray *arProgTexts;
    NSMutableDictionary *dictProg;
}

// expose
@property (assign) id delegate;

@property (nonatomic, strong) M_ABAPClass *abapClass;
@property (nonatomic, strong) NSMutableDictionary *dictMethodBuffer;
@property (nonatomic, strong) NSMutableDictionary *dictEventBuffer;

@property (nonatomic, strong) M_ABAPFugr *abapFugr;

@property (nonatomic, strong) M_ABAPProgram *abapProgram;

@end
