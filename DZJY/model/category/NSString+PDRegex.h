//
//  NSString+PDRegex.h
//  RegexOnNSString
//
//  Created by Carl Brown on 10/3/11.
//  Copyright 2011 PDAgent, LLC. Released under MIT License.
//

#import <Foundation/Foundation.h>

#define Email_Check_Format  @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define Phone_Check_Format  @"^1[34578][0-9]{9}$"
#define Password_Check_Format  @"^[a-zA-Z0-9_]{6,12}$"
#define Name_Check_Format  @"^[a-zA-Z0-9]{2,20}$"
#define Identity_Check_Format  @"(^\\d{15}$)|(^\\d{17}([0-9]|X|x)$)"
#define Number_Check_Format  @"^[0-9]\\d*$"
#define Letter_Check_Format  @"^[a-zA-Z]*$"
#define Int_Number_Check_Format  @"^[1-9]\\d*$"
#define Decimal_Number_Check_Format  @"^((0\\.[0-9]{1,2})|([1-9]+[0-9]*\\.[0-9]{1,2})|([1-9]+[0-9]*))$"
#define ZipCode_Check_Format  @"^[1-9][0-9]{5}$"
#define BankCard_Check_Format @"^[1-9]{1}\\d{14,18}$"

@interface NSString (PDRegex)

-(NSString *) stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *) replacement;
-(NSString *) stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *) replacement caseInsensitive:(BOOL) ignoreCase;
-(NSString *) stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *) replacement caseInsensitive:(BOOL) ignoreCase treatAsOneLine:(BOOL) assumeMultiLine;
-(NSArray *) stringsByExtractingGroupsUsingRegexPattern:(NSString *)regex;
-(NSArray *) stringsByExtractingGroupsUsingRegexPattern:(NSString *)regex caseInsensitive:(BOOL) ignoreCase treatAsOneLine:(BOOL) assumeMultiLine;
-(BOOL) matchesPatternRegexPattern:(NSString *)regex;
-(BOOL) matchesPatternRegexPattern:(NSString *)regex caseInsensitive:(BOOL) ignoreCase treatAsOneLine:(BOOL) assumeMultiLine;

- (BOOL)isEmail;
- (BOOL)isPhoneNumber;
- (BOOL)isNumber;
- (BOOL)isUrl;
- (BOOL)isPassword;
- (BOOL)isIdentity;
- (BOOL)isBankCard;
@end
