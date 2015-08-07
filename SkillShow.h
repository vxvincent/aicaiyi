//
//  SkillShow.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkillShow : NSObject

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@property(copy,nonatomic) NSString *desc;
@property(copy,nonatomic) NSString *pic;
@property(copy,nonatomic) NSString *width;
@property(copy,nonatomic) NSString *height;

@end
