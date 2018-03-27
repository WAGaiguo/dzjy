//
//  BAPathGetter.m
//  BA
//
//  Created by wangaiguo on 17/6/8.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import "DZPathGetter.h"
#import "CWLSynthesizeSingleton.h"

@implementation DZPathGetter
CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(DZPathGetter, applicationPath)
- (NSString *)documentPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
    
}

- (NSString *)filePathInDocumentPathForName:(NSString *)fileName{
    NSString *documentsDirectory = [self documentPath];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

- (NSString *)resourcePath{
    return [[NSBundle mainBundle] resourcePath];
}
//读取文件方法
- (NSString *)filePathInResourcePathForName:(NSString *)fullFileName{
    return [[NSBundle mainBundle] pathForResource:fullFileName ofType:nil];
    
}
- (NSString *)filePathInResourcePathForName:(NSString *)fileName andExtention:(NSString *)ext{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:ext];
}

- (NSString *)libaryPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libaryDirectory = [paths objectAtIndex:0];
    return libaryDirectory;
}

- (NSString *)filePathInLibaryPathForName:(NSString *)fullFileName{
    NSString *libaryDirectory = [self libaryPath];
    return [libaryDirectory stringByAppendingPathComponent:fullFileName];
}

- (NSString *)temporaryPath{
    return NSTemporaryDirectory();
}
- (NSString *)filePathInTemporaryPathForName:(NSString *)fullFileName{
    NSString *tempPath = [self temporaryPath];
    return [tempPath stringByAppendingPathComponent:fullFileName];
}
NSString * UIDocumentFile(NSString *fileName) {
    return  [[DZPathGetter applicationPath] filePathInDocumentPathForName:fileName];
}
NSString * UIResourceFile(NSString *fileName) {
    return  [[DZPathGetter applicationPath] filePathInResourcePathForName:fileName];
}
NSString * UILibaryFile(NSString *fileName) {
    return  [[DZPathGetter applicationPath] filePathInLibaryPathForName:fileName];
}
NSString * UITemporaryFile(NSString *fileName) {
    return  [[DZPathGetter applicationPath] filePathInTemporaryPathForName:fileName];
}
NSString * UIDocumentPath() {
    return  [[DZPathGetter applicationPath] documentPath];
}
NSString * UIResourcePath() {
    return  [[DZPathGetter applicationPath] resourcePath];
}
NSString * UILibaryPath() {
    return  [[DZPathGetter applicationPath] libaryPath];
}
NSString * UITemporaryPath() {
    return  [[DZPathGetter applicationPath] temporaryPath];
}

@end
