
//
//  JsonUtils.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/6.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "JsonUtils.h"

@implementation JsonUtils

+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        
        return nil;
    }
    return dic;
}

///Json格式的ID转换成字典
+(NSDictionary *)dictionaryWithId:(id )responseObject{
    NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        
        return nil;
    }
    return dic;
    
}


@end
