//
//  ShowCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "PSCollectionViewCell.h"
#import <UIKit/UIKit.h>
#import "ImageLoad.h"
#import "SkillShow.h"
#define MARGIN 4.0

@interface ShowCell : PSCollectionViewCell
@property (nonatomic, retain) UIImageView *showImage;
@property (nonatomic, retain) UILabel *descLabel;
@end
