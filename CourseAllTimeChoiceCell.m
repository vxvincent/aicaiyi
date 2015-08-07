//
//  CourseAllTimeChoiceCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseAllTimeChoiceCell.h"

@implementation CourseAllTimeChoiceCell

- (void)awakeFromNib {
    [_jianButton addTarget:self action:@selector(jian:) forControlEvents:UIControlEventTouchUpInside];
    [_addButton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    _label.text = @"1";
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)jian:(id)sender
{
    if ([_label.text isEqualToString:@"1"]) {
        return ;
    }
    NSInteger value = [_label.text integerValue];
    _label.text = [NSString stringWithFormat:@"%ld",value-1];
    if (_delegate) {
        [_delegate value:_label.text];
    }
}

-(void)add:(id)sender
{
    NSInteger value = [_label.text integerValue];
    _label.text = [NSString stringWithFormat:@"%ld",value+1];
    if (_delegate) {
        [_delegate value:_label.text];
    }

}

@end
