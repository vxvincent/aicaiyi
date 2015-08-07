//
//  CourseAddressController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CourseAddressBlock) (NSString *address);

@interface CourseAddressController : UIViewController
{
    CourseAddressBlock _block;
}
@property (weak, nonatomic) IBOutlet UITextField *addressField;
-(void)addCourseAddressBlock:(CourseAddressBlock) block;
@end
