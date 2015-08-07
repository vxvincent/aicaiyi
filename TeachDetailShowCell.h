//
//  TeachDetailShowCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeachDetailShowCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *iamgeView;

@property(strong,nonatomic)UIImageView *image1;
@property(strong,nonatomic)UIImageView *image2;
@property(strong,nonatomic)UIImageView *image3;
@property(strong,nonatomic)UIImageView *image4;

-(void)addImages:(NSInteger)size;
@end
