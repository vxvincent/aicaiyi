//
//  TeachDetailShowCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeachDetailShowCell.h"

@implementation TeachDetailShowCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)addImages:(NSInteger)size
{
    if (size == 0) {
        return ;
    }
    CGFloat width = _iamgeView.frame.size.width;
    CGFloat height = _iamgeView.frame.size.height;
    CGFloat space = 1.f;
    UIColor *bgColor = [UIColor redColor];
    
    if (size == 1) {
        _image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        _image1.backgroundColor = bgColor;
        [_iamgeView addSubview:_image1];
    } else if (size == 2) {
        _image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width/2-space/2, height)];
        _image2 = [[UIImageView alloc] initWithFrame:CGRectMake(width/2+space, 0, width/2-space/2, height)];
        _image1.backgroundColor = bgColor;
        _image2.backgroundColor = bgColor;
        [_iamgeView addSubview:_image1];
        [_iamgeView addSubview:_image2];
    } else if (size == 3) {
        _image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width/2-space/2, height/2-space/2)];
        _image2 = [[UIImageView alloc] initWithFrame:CGRectMake(width/2+space, 0, width/2-space/2, height/2-space/2)];
         _image3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, height/2+space, width/2-space/2, height/2-space/2)];

        _image1.backgroundColor = bgColor;
        _image2.backgroundColor = bgColor;
        _image3.backgroundColor = bgColor;

        [_iamgeView addSubview:_image1];
        [_iamgeView addSubview:_image2];
        [_iamgeView addSubview:_image3];

    } else {
        _image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width/2-space/2, height/2-space/2)];
        _image2 = [[UIImageView alloc] initWithFrame:CGRectMake(width/2+space, 0, width/2-space/2, height/2-space/2)];
        _image3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, height/2+space, width/2-space/2, height/2-space/2)];
        _image4 = [[UIImageView alloc] initWithFrame:CGRectMake(width/2+space, height/2+space, width/2-space/2, height/2-space/2)];
        _image1.backgroundColor = bgColor;
        _image2.backgroundColor = bgColor;
        _image3.backgroundColor = bgColor;
        _image4.backgroundColor = bgColor;
        [_iamgeView addSubview:_image1];
        [_iamgeView addSubview:_image2];
        [_iamgeView addSubview:_image3];
        [_iamgeView addSubview:_image4];
    
    }
}
@end
