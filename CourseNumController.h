//
//  CourseNumController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CourseNumBlock) (NSString *time);

@interface CourseNumController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    CourseNumBlock _block;
}
@property(strong,nonatomic) NSArray *data;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property(strong,nonatomic) NSString *num;
-(void)addCourseNumBlcok:(CourseNumBlock)blcok;

@end
