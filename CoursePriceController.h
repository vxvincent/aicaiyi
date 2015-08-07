//
//  CoursePriceController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CoursePriceBlock)(NSString *price);

@interface CoursePriceController : UIViewController
{
    CoursePriceBlock _block;
}
@property (weak, nonatomic) IBOutlet UITextField *priceField;

-(void)addCoursePriceBlock:(CoursePriceBlock)block;
@end
