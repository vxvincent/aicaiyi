//
//  CourseAllTimeChoiceCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CourseAllTimeDelegate <NSObject>

-(void)value:(NSString *)value;

@end

@interface CourseAllTimeChoiceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *jianButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong,nonatomic) id<CourseAllTimeDelegate> delegate;
@end
