//
//  ABAPCodeFormatUtil.h
//  SLViewer
//
//  Created by stephen macleod on 2015-04-30.
//  Copyright (c) 2015 steve macleod. All rights reserved.
//

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
