//
//  AFNetWorkTool.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFNetWorkTool : NSObject

///获取Html文本格式内容
+(void)HtmlWithGetUrl:(NSString *)url success:(void (^)(id responseObject))success fail:(void (^)(NSError *error))fail;
///POST方法
+(void)PostWithUrl:(NSString *)url
        parameters:(NSMutableDictionary *)parameters
         filePaths: (NSMutableDictionary *)filePaths
           success:(void (^)(NSDictionary* dic))success
              fail:(void(^)(NSString *message))fail
             error:(void (^)(NSError *e))error;
///GET方法
+(void)HtmlWithGetUrl:(NSString *)url
              success:(void (^)(NSDictionary* dic))success
                 fail:(void(^)(NSString *message))fail
                error:(void (^)(NSError *e))error;
///登录
+(void)LoginHttp:(NSString *)url
         success:(void (^)(NSDictionary* dic))success
            fail:(void(^)(NSString *message))fail
           error:(void (^)(NSError *e))error;

@end
