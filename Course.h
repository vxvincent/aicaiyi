//
//  Course.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject

@property(strong,nonatomic)NSString *ID;
@property(strong,nonatomic)NSString *teacher_name;
@property(strong,nonatomic)NSString *teacher_id;
@property(strong,nonatomic)NSString *teacher_age;
@property(strong,nonatomic)NSString *course_name;
@property(strong,nonatomic)NSString *week;
@property(strong,nonatomic)NSString *photo;
+(void)parseWithDic:(NSDictionary *)dic addArray:(NSMutableArray *)array;

@end
