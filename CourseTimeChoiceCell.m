//
//  CourseTimeChoiceCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseTimeChoiceCell.h"

@interface CourseTimeChoiceCell ()<ClassTabelDelegate>

@end


@implementation CourseTimeChoiceCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        CGFloat top =(SCREEN_WIDTH- 30*7)/14;
        _collection = [[ClassTableCollection alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,  30*4 + 5*top) collectionViewLayout:flowLayout];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.classTabelDelegate = self;
        
        [self.contentView addSubview:_collection];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
    
}
-(void)setIsGroup:(Boolean) isGroup
{
    _collection.isGroup = isGroup;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    
}

+(CGFloat)getHeight
{
    CGFloat top =(SCREEN_WIDTH- 30*7)/14;
    return 30*4 + 5*top;
}

#pragma mark - ClassTableCollection代理
-(void)setSelectedClass:(NSIndexPath *)indexPath result:(NSString *)result
{
    if (_allClassTabelDelegate) {
        [_allClassTabelDelegate setSelectedAllClass:indexPath result:result];
    }
}

@end
