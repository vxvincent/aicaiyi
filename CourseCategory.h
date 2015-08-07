//
//  CourseCategory.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CourseCategoryBlock)(NSInteger  cc);

@interface CourseCategory : UITableViewController
{
    CourseCategoryBlock _block;
}
@property(strong,nonatomic)NSArray *category;
-(void) addCourseCategoryBlock:(CourseCategoryBlock)block;

@end
