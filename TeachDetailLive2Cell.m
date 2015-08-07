//
//  TeachDetailLive2Cell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeachDetailLive2Cell.h"

@implementation TeachDetailLive2Cell

- (void)awakeFromNib {
    // Initialization code
    _yuanLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _yuanLabel.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    _yuanLabel.layer.borderWidth  = 1.0f;

    _yuanLabel.layer.cornerRadius = 3.0f;
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
