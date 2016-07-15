//
//  ABAPCodeFormatUtil.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-30.
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

typedef NS_ENUM(int,ABAPCommandType)
{
    C_ABAPCommand_CALL_METHOD,
    C_ABAPCommand_CALL_FUNCTION,
    C_ABAPCommand_EXPORTING,
    C_ABAPCommand_IMPORTING,
    C_ABAPCommand_RETURNING,
    C_ABAPCommand_RECEIVING,
    C_ABAPCommand_CHANGING,
    C_ABAPCommand_TABLES,
    C_ABAPCommand_EXCEPTIONS
};

@interface ABAPCodeFormatUtil : NSObject
{
    int _abapCommand;
}


-(NSAttributedString*)formatCommentInSourceString:(NSString*)sourceString;

// deprecated 2015-05-01
-(NSAttributedString*)formatCodeString:(NSString*)sourceString;


-(NSAttributedString*)formatLineFromString:(NSString*)sourceString;


@end
