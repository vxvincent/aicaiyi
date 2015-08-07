//
//  AFNetWorkTool.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "AFNetWorkTool.h"
#import "JsonUtils.h"

@implementation AFNetWorkTool

+(void)HtmlWithGetUrl:(NSString *)url success:(void (^)(id))success fail:(void (^)(NSError *))fail
{
    [self setCookieInHttp];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/javascript", nil];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        fail(error);
    }];
}

+(void)HtmlWithGetUrl:(NSString *)url
            success:(void (^)(NSDictionary* dic))success
            fail:(void(^)(NSString *message))fail
            error:(void (^)(NSError *e))error
{
    [self setCookieInHttp];
    url =  [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/javascript", nil];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [JsonUtils dictionaryWithId:responseObject];
        
        if ([[dic objectForKey:@"result"] integerValue]==1) {
            success(dic);
        } else {
            fail([dic objectForKey:@"message"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *e) {
        error(e);
    }];


}

///Post
+(void)PostWithUrl:(NSString *)url
              parameters:(NSMutableDictionary *)parameters
              filePaths: (NSMutableDictionary *)filePaths
              success:(void (^)(NSDictionary *))success
              fail:(void (^)(NSString *))fail
              error:(void (^)(NSError *))error

{
    [self setCookieInHttp];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/javascript", nil];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
        if (filePaths) {
            for (int i = 0; i < [filePaths count]; i ++) {
                NSEnumerator *enumerator = [filePaths keyEnumerator];
                id key;
                while ((key = [enumerator nextObject])) {
                    NSLog(@"key = %@", key);
                    NSLog(@"value = %@", [filePaths objectForKey:key]);
                    [formData appendPartWithFileURL:[NSURL fileURLWithPath:[filePaths objectForKey:key]] name:key error:nil];
                }
            }
        }
 
    } success:^(NSURLSessionDataTask *operation, id responseObject) {
        NSDictionary *dic = [JsonUtils dictionaryWithId:responseObject];
        
        if ([[dic objectForKey:@"result"] integerValue]==1) {
            success(dic);
        } else {
            fail([dic objectForKey:@"message"]);
        }

    } failure:^(NSURLSessionDataTask *operation, NSError *e) {
        error(e);
    }];
}

+(void)LoginHttp:(NSString *)url success:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail error:(void (^)(NSError *))error
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/javascript", nil];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [JsonUtils dictionaryWithId:responseObject];
        
        if ([[dic objectForKey:@"result"] integerValue]==1) {
            success(dic);
            NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:BASE_URL]];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:DEFAULTCOOKIE];
            [[NSUserDefaults standardUserDefaults] synchronize];
        } else {
            fail([dic objectForKey:@"message"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *e) {
        error(e);
    }];

    
}


///设置cookie
+(void)setCookieInHttp
{
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:DEFAULTCOOKIE];
    if([cookiesdata length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    
    }
}

///获取cookie
+(void)getCookieInHttp
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookies) {
        // Here I see the correct rails session cookie
        NSLog(@"Block cookie: %@", cookie);
    }
    
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey:DEFAULTCOOKIE];
    [defaults synchronize];
    

}
@end
