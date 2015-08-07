//
//  Course.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "Course.h"

@implementation Course

+(void)parseWithDic:(NSDictionary *)dic addArray:(NSMutableArray *)array
{
    if (!dic) {
        return ;
    }
    if (![[dic objectForKey:@"list"] isKindOfClass:[NSArray class]]) {
        return ;
    }
    NSArray *tempA = [dic objectForKey:@"list"];
    for (NSDictionary *tempD in tempA) {
        Course *c = [Course new];
        c.ID = [tempD objectForKey:@"id"];
        c.teacher_name = [tempD objectForKey:@"name"];
        c.teacher_id = [tempD objectForKey:@"teacher_id"];
        c.teacher_age = [tempD objectForKey:@"seniority"];
        c.week = [tempD objectForKey:@"week"];
        c.course_name = [tempD objectForKey:@"course_name"];
        c.photo = [tempD objectForKey:@"photo"];
        [array addObject:c];
    }

}
@end
