//
//  ABAPCodeFormatUtil.m
//  SLViewer
//
//  Created by stephen macleod on 2015-04-30.
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
//
// formatting:
// * this is a comment and will appear in blue
// " this is a comment and will appear in gray
// this is a normal like of code and will appear in black
// data: var1 type kennzx.    " comment will appear in grey, code in black
//
// call function 'FUNCTION_NAME'
//   EXPORTING
//   IMPORTING
//   CHANGING
//   TABLES
//   EXCEPTIONS
//
// call method 'METHOD_NAME'
//  RETURNING
//  EXPORTING
//  IMPORTING
//  CHANGING
//  EXCEPTIONS
//
// perform 'FORM_NAME'
//
// IF
// ELSE.
// ELSEIF
// ENDIF.
//
// CASE
// WHEN
// ENDCASE
//
// LOOP
// ENDLOOP
//
// DO
// ENDDO
//
// WHILE
// ENDWHILE
// UNTIL (?)


#import "ABAPCodeFormatUtil.h"
#import <Cocoa/Cocoa.h>

@implementation ABAPCodeFormatUtil


-(NSAttributedString*)formatCommentInSourceString:(NSString*)sourceString
{
    // NSString *sn = [NSString stringWithFormat:@"%@\n",s];
    NSRange rng;
    rng.location = 0;
    rng.length = [sourceString length];
    
    // create the AttributedString
    NSMutableAttributedString *as = [[NSMutableAttributedString alloc]initWithString:sourceString];
    
    // here look for * or " as the first occurance of a
    // non-whitespace character in the line
    NSString *testString = [sourceString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *firstChar = [testString substringToIndex:1];
    if([firstChar isEqualToString:@"*"])
    {
        [as addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:rng];
    }
    
    if([firstChar isEqualToString:@"\""])
    {
        [as addAttribute:NSForegroundColorAttributeName value:[NSColor grayColor] range:rng];
    }
    
    if(![firstChar isEqualToString:@"*"] && ![firstChar isEqualToString:@"\""])
    {
        NSRange inlineCommentRange = [sourceString rangeOfString:@"\""];
        if(inlineCommentRange.length >0)
        {
            //DLog(@"%lu",inlineCommentRange.location);
            //DLog(@"%lu",inlineCommentRange.length);
            //DLog(@"%lu",sourceString.length);
            
            NSRange codeRange;
            codeRange.location = 0;
            codeRange.length = inlineCommentRange.location - 1;
            NSString *codeString = [sourceString substringWithRange:codeRange];
            
            inlineCommentRange.length = sourceString.length - inlineCommentRange.location;
            NSString *commentString = [sourceString substringWithRange:inlineCommentRange];
            
            // recreate the attributedstring using the codeString
            as = [[NSMutableAttributedString alloc]initWithString:codeString];
            [as addAttribute:NSForegroundColorAttributeName value:[NSColor blackColor] range:NSMakeRange(0, [as length])];
            
            // create an attributedstring for the inline comment section of the line
            NSMutableAttributedString *commentAString = [[NSMutableAttributedString alloc]initWithString:commentString];
            [commentAString addAttribute:NSForegroundColorAttributeName value:[NSColor grayColor] range:NSMakeRange(0,[commentString length])];
            [as appendAttributedString:commentAString];
        }
        else
        {
            rng.location = 0;
            rng.length = [as length];
            [as addAttribute:NSForegroundColorAttributeName value:[NSColor blackColor] range:rng];
            // NSAttributedString *testAS = [self formatCodeString:[as string]];
            //if(testAS)
            //{
            //    return testAS;
            //}
            //else
            //{
                return as;
            //}
        }
    }

    return (NSAttributedString*)as;
}


-(NSAttributedString*)formatLineFromString:(NSString*)sourceString
{
    
    
    return nil;
}


// deprecated - 2015-05-01
-(NSAttributedString*)formatCodeString:(NSString*)sourceString
{
    _abapCommand = -1;
    NSRange callRange;
    NSRange itemRange;
    
    NSString *workingString = [sourceString uppercaseString];
    NSScanner *scanner = [NSScanner scannerWithString:workingString];
    __unused NSString *editedString;
    
    if([scanner scanString:@"CALL METHOD " intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_CALL_METHOD;
    }
    
    if([scanner scanString:@"EXPORTING" intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_EXPORTING;
    }
    
    if([scanner scanString:@"IMPORTING" intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_IMPORTING;
    }
    
    if([scanner scanString:@"CHANGING" intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_CHANGING;
    }

    if([scanner scanString:@"RECEIVING" intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_RECEIVING;
    }
    
    if([scanner scanString:@"TABLES" intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_TABLES;
    }
    
    if([scanner scanString:@"EXCEPTIONS" intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_EXCEPTIONS;
    }
    
    if([scanner scanString:@"CALL FUNCTION '" intoString:NULL])
    {
        _abapCommand = C_ABAPCommand_CALL_FUNCTION;
    }
    
    
    switch (_abapCommand)
    {
        case C_ABAPCommand_CALL_METHOD:
        {
            DLog(@"CALL METHOD DETECTED");
            callRange = [sourceString rangeOfString:@"CALL METHOD" options:NSCaseInsensitiveSearch];
            callRange.length = callRange.location + callRange.length;
            callRange.location = 0;
            
            itemRange.location = callRange.length;// + 1;
            itemRange.length = [sourceString length]-itemRange.location;
            
            NSMutableAttributedString *callAString = [[NSMutableAttributedString alloc]initWithString:[sourceString substringWithRange:callRange]];
            [callAString addAttribute:NSForegroundColorAttributeName value:[NSColor magentaColor] range:NSMakeRange(0,[callAString length])];
            
            NSAttributedString *itemString = [[NSAttributedString alloc]initWithString:[sourceString substringWithRange:itemRange]];
            [callAString appendAttributedString:itemString];
            return callAString;
        }
            break;
            
            
        case C_ABAPCommand_EXPORTING:
        {
            callRange = [sourceString rangeOfString:@"EXPORTING\n" options:NSCaseInsensitiveSearch];
            callRange.length = callRange.location + callRange.length;
            callRange.location = 0;
            NSMutableAttributedString *callAString = [[NSMutableAttributedString alloc]initWithString:[sourceString substringWithRange:callRange]];
            [callAString addAttribute:NSForegroundColorAttributeName value:[NSColor magentaColor] range:NSMakeRange(0,[callAString length])];
            return callAString;
        }
            break;
            
        case C_ABAPCommand_IMPORTING:
        {
            callRange = [sourceString rangeOfString:@"IMPORTING\n" options:NSCaseInsensitiveSearch];
            callRange.length = callRange.location + callRange.length;
            callRange.location = 0;
            NSMutableAttributedString *callAString = [[NSMutableAttributedString alloc]initWithString:[sourceString substringWithRange:callRange]];
            [callAString addAttribute:NSForegroundColorAttributeName value:[NSColor magentaColor] range:NSMakeRange(0,[callAString length])];
            return callAString;
        }
            break;
            
        case C_ABAPCommand_RECEIVING:
        {
            callRange = [sourceString rangeOfString:@"RECEIVING\n" options:NSCaseInsensitiveSearch];
            callRange.length = callRange.location + callRange.length;
            callRange.location = 0;
            NSMutableAttributedString *callAString = [[NSMutableAttributedString alloc]initWithString:[sourceString substringWithRange:callRange]];
            [callAString addAttribute:NSForegroundColorAttributeName value:[NSColor magentaColor] range:NSMakeRange(0,[callAString length])];
            return callAString;
        }
            break;
            
        case C_ABAPCommand_EXCEPTIONS:
        {
            callRange = [sourceString rangeOfString:@"EXCEPTIONS\n" options:NSCaseInsensitiveSearch];
            callRange.length = callRange.location + callRange.length;
            callRange.location = 0;
            NSMutableAttributedString *callAString = [[NSMutableAttributedString alloc]initWithString:[sourceString substringWithRange:callRange]];
            [callAString addAttribute:NSForegroundColorAttributeName value:[NSColor magentaColor] range:NSMakeRange(0,[callAString length])];
            return callAString;
        }
            break;
            
        case C_ABAPCommand_CALL_FUNCTION:
        {
            // DLog(@"CALL FUNCTION identified");
        }
            
        default:
            break;
    }
    
    return nil;
}





@end
