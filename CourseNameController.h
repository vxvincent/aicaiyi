//
//  CourseNameController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CourseNameBlock) (NSString *name);

@interface CourseNameController : UIViewController
{
    CourseNameBlock _courseNameBlock;
}

@property (weak, nonatomic) IBOutlet UITextField *nameField;

-(void)addCourseNameBlock:(CourseNameBlock) block;
@end
