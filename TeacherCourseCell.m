//
//  TeacherCourseCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeacherCourseCell.h"

@implementation TeacherCourseCell

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style
//                reuseIdentifier:reuseIdentifier];
//    if (self) {
//
//        
//        [self addViews];
//    }
//    return self;
//}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier containingTableView:(UITableView *)containingTableView leftUtilityButtons:(NSArray *)leftUtilityButtons rightUtilityButtons:(NSArray *)rightUtilityButtons
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier containingTableView:containingTableView leftUtilityButtons:leftUtilityButtons rightUtilityButtons:rightUtilityButtons];
    if (self) {
        [self addViews];
    }
    return self;
}

-(void)addViews
{
    _pImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    _pImage.image = [UIImage imageNamed:@"class_ban"];
    [self.contentView addSubview:_pImage];
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(37, 10, 197, 21)];
    _nameLabel.text = @"成人钢琴体验课";
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont fontWithName:@"Helvetica" size:17.f];
    [self.contentView addSubview:_nameLabel];
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 10, 89, 21)];
    _priceLabel.text = @"￥150";
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.textAlignment = NSTextAlignmentRight;
    _priceLabel.font = [UIFont fontWithName:@"Helvetica" size:17.f];
    [self.contentView addSubview:_priceLabel];
    _biaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(279, 10, 33, 21)];
    _biaoLabel.text = @"元/课";
    _biaoLabel.textColor = [UIColor blackColor];
    _biaoLabel.textAlignment = NSTextAlignmentRight;
    _biaoLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_biaoLabel];
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(37, 30, 197, 21)];
    _timeLabel.text = @"2015年5月20日 14:00~15:00";
    _timeLabel.textColor = [UIColor lightGrayColor];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    _timeLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_timeLabel];
    _numsLabel = [[UILabel alloc] initWithFrame:CGRectMake(234, 30, 78, 21)];
    _numsLabel.text = @"上限:10人";
    _numsLabel.textColor = [UIColor lightGrayColor];
    _numsLabel.textAlignment = NSTextAlignmentRight;
    _numsLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_numsLabel];
    _methodLabel = [[UILabel alloc] initWithFrame:CGRectMake(37, 49, 151, 21)];
    _methodLabel.text = @"学生上门，老师上门";
    _methodLabel.textColor = [UIColor lightGrayColor];
    _methodLabel.textAlignment = NSTextAlignmentLeft;
    _methodLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_methodLabel];
    _categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(37, 69, 151, 21)];
    _categoryLabel.text = @"试听课";
    _categoryLabel.textColor = [UIColor lightGrayColor];
    _categoryLabel.textAlignment = NSTextAlignmentLeft;
    _categoryLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_categoryLabel];
    _reportLabel = [[UILabel alloc] initWithFrame:CGRectMake(234, 49, 78, 21)];
    _reportLabel.text = @"已报名:12/人";
    _reportLabel.textColor = [UIColor lightGrayColor];
    _reportLabel.textAlignment = NSTextAlignmentRight;
    _reportLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_reportLabel];
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(234, 69, 78, 21)];
    _priceLabel.text = @"￥12元/时";
    _priceLabel.textColor = [UIColor lightGrayColor];
    _priceLabel.textAlignment = NSTextAlignmentRight;
    _priceLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    [self.contentView addSubview:_priceLabel];
}
@end
