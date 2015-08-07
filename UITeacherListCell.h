//
//  UITeacherListCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/16.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITeacherListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;

@property (weak, nonatomic) IBOutlet UILabel *teachNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *teachAge;

@end
