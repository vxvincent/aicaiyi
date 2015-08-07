//
//  ShowCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "ShowCell.h"

@implementation ShowCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.showImage];
        
        self.descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.descLabel.numberOfLines=0;
        [self addSubview:self.descLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width - MARGIN * 2;
    CGFloat top = MARGIN;
    CGFloat left = MARGIN;
    SkillShow *show = (SkillShow *)self.object;
    // Image
    CGFloat objectWidth = [show.width floatValue];
    CGFloat objectHeight = [show.height floatValue];
    CGFloat scaledHeight = floorf(objectHeight / (objectWidth / width));
    self.showImage.frame = CGRectMake(left, top, width, scaledHeight);
    
    // Label
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:self.descLabel.font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
   CGSize labelSize = [self.descLabel.text boundingRectWithSize:CGSizeMake(width, INTMAX_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    top = self.showImage.frame.origin.y + self.showImage.frame.size.height + MARGIN;
    self.descLabel.frame = CGRectMake(left, top, labelSize.width, labelSize.height);

}

-(void)fillViewWithObject:(id)object
{
    [super fillViewWithObject:object];
    SkillShow *show = (SkillShow *)object;
    [ImageLoad imageLoadWithImage:self.showImage withUrl:show.pic];
    self.descLabel.text = @"1231231232131232132131231231231231231231231";

}
+(CGFloat)heightForViewWithObject:(id)object inColumnWidth:(CGFloat)columnWidth
{
    CGFloat height = 0.0;
    CGFloat width = columnWidth - MARGIN * 2;
    height += MARGIN;
    
    SkillShow *show = (SkillShow *)object;
    // Image
    CGFloat objectWidth = [ show.width floatValue];
    CGFloat objectHeight = [ show.height floatValue];
    CGFloat scaledHeight = floorf(objectHeight / (objectWidth / width));
    height += scaledHeight;

    
    // Label
    NSString *desc = show.desc;
    UIFont *labelFont = [UIFont boldSystemFontOfSize:14.0];
   
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:labelFont, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [desc boundingRectWithSize:CGSizeMake(width, INTMAX_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    
    height += labelSize.height;
    
    height += MARGIN;
    
    return height;

}


@end
