//
//  BAPathGetter.h
//  BA
//
//  Created by wangaiguo on 17/6/8.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZPathGetter : NSObject

+ (DZPathGetter *)applicationPath;

- (NSString *)documentPath;
- (NSString *)filePathInDocumentPathForName:(NSString *)fileName;

- (NSString *)resourcePath;
- (NSString *)filePathInResourcePathForName:(NSString *)fullFileName;
- (NSString *)filePathInResourcePathForName:(NSString *)fileName andExtention:(NSString *)ext;

- (NSString *)libaryPath;
- (NSString *)filePathInLibaryPathForName:(NSString *)fullFileName;

- (NSString *)temporaryPath;
- (NSString *)filePathInTemporaryPathForName:(NSString *)fullFileName;


FOUNDATION_EXPORT NSString * UIDocumentFile(NSString *);
FOUNDATION_EXPORT NSString * UIResourceFile(NSString *);
FOUNDATION_EXPORT NSString * UILibaryFile(NSString *);
FOUNDATION_EXPORT NSString * UITemporaryFile(NSString *);

FOUNDATION_EXPORT NSString * UIDocumentPath(void);
FOUNDATION_EXPORT NSString * UIResourcePath(void);
FOUNDATION_EXPORT NSString * UILibaryPath(void);
FOUNDATION_EXPORT NSString * UITemporaryPath(void);

@end
