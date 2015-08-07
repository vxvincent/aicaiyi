//
//  CourseTimeController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CourseTimeBlock) (NSString *time);

@interface CourseTimeController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    CourseTimeBlock _block;
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property(strong,nonatomic) NSArray *data;
@property(strong,nonatomic) NSString *time;
-(void)addCourseTimeBlcok:(CourseTimeBlock)blcok;
@end
