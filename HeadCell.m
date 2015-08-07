//
//  HeadCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "HeadCell.h"

@implementation HeadCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
      
    }
    return self;
}



+(CGFloat)getHeight{
    return 334;
}
@end
