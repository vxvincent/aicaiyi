//
//  SkillShow.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "SkillShow.h"

@implementation SkillShow


-(instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.width = @"750";
        self.height= @"479";
        self.pic = [dic objectForKey:@"pic"];
    }
    return self;
}

@end
