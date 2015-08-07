//
//  Config.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Config : NSObject

///是否登录
@property BOOL isLogin;
///获取用户ID
+(NSString *)getOwnId;
///获取单例
+(Config *)getInstance;
///保存登录用户信息
+(void)saveLoginUserInfo:(User *)user;
///获取登录用户信息
+(User *)getLoginUserInfo;
@end
