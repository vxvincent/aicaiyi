//
//  Config.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "Config.h"
#import "User.h"

NSString * const UserID = @"userID";

@implementation Config

-(instancetype)init
{
    self = [super init];
    if (self) {
        _isLogin = false;
    }
    return self;
}

+(NSString *)getOwnId
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userId = [userDefault objectForKey:UserID];
    return  userId;
}

+(void)saveLoginUserInfo:(User *)user
{
    NSUserDefaults *uD = [NSUserDefaults standardUserDefaults];
    [uD setObject:user.username forKey:@"username"];
    [uD setObject:user.nickname forKey:@"nickname"];
    [uD setObject:user.address forKey:@"address"];
    [uD setObject:user.birthday forKey:@"birthday"];
    [uD setObject:user.city forKey:@"city"];
    [uD setObject:user.district forKey:@"district"];
    [uD setObject:user.password forKey:@"password"];
    [uD setObject:user.phone forKey:@"phone"];
    [uD setObject:user.photo forKey:@"photo"];
    [uD setObject:user.province forKey:@"province"];
    [uD setObject:user.sex forKey:@"sex"];
    [uD setObject:user.user_type forKey:@"user_type"];
    [uD setObject:user.name forKey:@"name"];
    [uD synchronize];
}

+(User *)getLoginUserInfo
{
    NSUserDefaults *uD = [NSUserDefaults standardUserDefaults];
    NSString *username = [uD objectForKey:@"username"];
    if (!username) {
        return nil;
    }
    User *user = [[User alloc] init];
    user.username = username;
    user.nickname = [uD objectForKey:@"nickname"];
    user.address = [uD objectForKey:@"address"];
    user.birthday = [uD objectForKey:@"birthday"];
    user.city = [uD objectForKey:@"city"];
    user.district = [uD objectForKey:@"district"];
    user.password = [uD objectForKey:@"password"];
    user.phone = [uD objectForKey:@"phone"];
    user.photo = [uD objectForKey:@"photo"];
    user.province = [uD objectForKey:@"province"];
    user.sex = [uD objectForKey:@"sex"];
    user.user_type = [uD objectForKey:@"user_type"];
    user.name = [uD objectForKey:@"name"];

    return user;
}

+(Config *)getInstance
{
    static Config *config;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[Config alloc] init];
    });
    return config;
}

@end
