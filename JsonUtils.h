//
//  JsonUtils.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/6.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonUtils : NSObject

///Json格式的字符串转换成字典
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
///Json格式的ID转换成字典
+(NSDictionary *)dictionaryWithId:(id )responseObject;

@end
