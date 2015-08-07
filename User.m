//
//  User.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/19.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "User.h"

@implementation User


-(instancetype)initWithDictionary:(NSDictionary *)dic withPassword:(NSString *)password
{
    self = [super init];
    if (self) {
        NSDictionary *uDic = [dic objectForKey:@"data"];
        self.username = [uDic objectForKey:@"username"];
        self.nickname = [uDic objectForKey:@"nickname"];
        self.address = [uDic objectForKey:@"address"];
        self.birthday = [uDic objectForKey:@"birthday"];
        self.city = [uDic objectForKey:@"city"];
        self.district = [uDic objectForKey:@"district"];
        self.password = password;
        self.phone = [uDic objectForKey:@"phone"];
        self.photo = [uDic objectForKey:@"photo"];
        self.province = [uDic objectForKey:@"province"];
        self.sex = [uDic objectForKey:@"sex"];
        self.user_type = [uDic objectForKey:@"user_type"];
        self.name = [uDic objectForKey:@"name"];
    }
    return self;
}

@end
