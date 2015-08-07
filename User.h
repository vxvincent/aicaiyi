//
//  User.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/19.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(strong,nonatomic)NSString *username;
@property(strong,nonatomic)NSString *nickname;

@property(strong,nonatomic)NSString *address;
@property(strong,nonatomic)NSString *birthday;
@property(strong,nonatomic)NSString *city;
@property(strong,nonatomic)NSString *district;
@property(strong,nonatomic)NSString *password;
@property(strong,nonatomic)NSString *phone;
@property(strong,nonatomic)NSString *photo;
@property(strong,nonatomic)NSString *province;
@property(strong,nonatomic)NSString *sex;
@property(strong,nonatomic)NSString *user_type;
@property(strong,nonatomic)NSString *name;

-(instancetype)initWithDictionary:(NSDictionary *)dic withPassword:(NSString *)password;

@end
