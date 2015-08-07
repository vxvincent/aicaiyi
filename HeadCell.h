//
//  HeadCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoScrollView.h"
@interface HeadCell : UITableViewCell
@property (weak, nonatomic) IBOutlet AutoScrollView *autoScroll;

@property (weak, nonatomic) IBOutlet UILabel *teachLabel;

@property (weak, nonatomic) IBOutlet UILabel *studentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *musicImage;

@property (weak, nonatomic) IBOutlet UIImageView *artImage;
+(CGFloat)getHeight;
@property (weak, nonatomic) IBOutlet UIImageView *sportImage;
@property (weak, nonatomic) IBOutlet UIImageView *whatImage;

@property (weak, nonatomic) IBOutlet UILabel *musicLabel;
@property (weak, nonatomic) IBOutlet UILabel *artLabel;
@property (weak, nonatomic) IBOutlet UILabel *sportLabel;

@property (weak, nonatomic) IBOutlet UILabel *whatLabel;


@end
