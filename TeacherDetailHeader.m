//
//  TeacherDetailHeader.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeacherDetailHeader.h"
#import "UIColor+Util.h"
@implementation TeacherDetailHeader

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self _baseConfigs];
    }
    return self;
}

-(void)_baseConfigs
{
    self.backgroundColor = [UIColor whiteColor];
    _height = SCREEN_WIDTH/2 + 80;
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_WIDTH/2;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    self.imageView.image = [UIImage imageNamed:@"nobackgroud"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    [self addSubview:self.imageView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, height-30, 65, 110)];
    view.backgroundColor = [UIColor whiteColor];
    _photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, 61, 61)];
    _photoImage.image = [UIImage imageNamed:@"nopic"];
    _photoImage.contentMode = UIViewContentModeScaleAspectFill;
    _photoImage.clipsToBounds = YES;
    [view addSubview:_photoImage];
    _starLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 65, 20)];
    _starLabel.text = @"5.0";
    _starLabel.textColor = [UIColor redColor];
    _starLabel.textAlignment = NSTextAlignmentCenter;
    _starLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20.f];
    [view addSubview:_starLabel];
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 95, 65, 10)];
    _label1.text = @"综合评分";
    _label1.textColor = [UIColor textGrayColor];
    _label1.textAlignment = NSTextAlignmentCenter;
    _label1.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [view addSubview:_label1];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(90, SCREEN_WIDTH/2+10, SCREEN_WIDTH-100, 65)];
    view1.backgroundColor = [UIColor whiteColor];
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 55, 20)];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.textAlignment = NSTextAlignmentRight;
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:17.f];
    _nameLabel.text = @"朱子轩";
    _vipImage = [[UIImageView alloc] initWithFrame:CGRectMake(56, 5, 10, 10)];
    _vipImage.image = [UIImage imageNamed:@"vip"];
    _identifiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, view1.frame.size.width, 10)];
    _identifiLabel.text = @"8年教龄 | 1项认证 | 1个班课 | 7条评价";
    _identifiLabel.textColor = [UIColor textGrayColor];
    _identifiLabel.textAlignment = NSTextAlignmentLeft;
    _identifiLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    
    _acceptLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, view1.frame.size.width, 10)];
    _acceptLabel.text = @"靠谱指数:5.0  教学态度:5.0  响应速度:5.0";
    _acceptLabel.textColor = [UIColor textGrayColor];
    _acceptLabel.textAlignment = NSTextAlignmentLeft;
    _acceptLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [view1 addSubview:_acceptLabel];
    [view1 addSubview:_identifiLabel];
    [view1 addSubview:_vipImage];
    [view1 addSubview:_nameLabel];
    [self addSubview:view1];
    [self addSubview:view];
    
}

-(void)awakeFromNib
{
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == self) {
        return nil;
    }
    return view;
}

@end
