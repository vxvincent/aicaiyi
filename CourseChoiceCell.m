//
//  CourseChoiceCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseChoiceCell.h"


@implementation CourseChoiceCell

- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)courseNameChanged:(id)sender {
    
    if (_isOpened) {

        [UIView animateWithDuration:0.3 animations:^{
            UIImage *closeImage=[UIImage imageNamed:@"dropdown.png"];
            [_openButton setImage:closeImage forState:UIControlStateNormal];
//            CGRect frame=_tb.frame;
//            frame.size.height=1;
//            [_tb setFrame:frame];
            if (_delegate) {
                [_delegate selectCell:self withIsOpened:!_isOpened];
            }
        } completion:^(BOOL finished){
            _isOpened=NO;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            UIImage *openImage=[UIImage imageNamed:@"dropup.png"];
            [_openButton setImage:openImage forState:UIControlStateNormal];
//            
//            CGRect frame=_tb.frame;
//            
//            frame.size.height=200;
//            [_tb setFrame:frame];
            if (_delegate) {
                [_delegate selectCell:self withIsOpened:!_isOpened];
            }
        } completion:^(BOOL finished){
            
            _isOpened=YES;
        }];
        
        
    }
}
@end
