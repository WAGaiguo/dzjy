//
//  NSDate+AES.h
//  llhz
//
//  Created by kelamo on 2016/11/24.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)
- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
@end
