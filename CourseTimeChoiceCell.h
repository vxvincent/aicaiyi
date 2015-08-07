//
//  CourseTimeChoiceCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassTableCollection.h"


@protocol CourseTimeChoiceCellDelegate <NSObject>

-(void)setSelectedAllClass:(NSIndexPath *)indexPath result:(NSString *)result;

@end

@interface CourseTimeChoiceCell : UITableViewCell

@property(strong,nonatomic)ClassTableCollection *collection;
+(CGFloat) getHeight;

@property(nonatomic,strong)id<CourseTimeChoiceCellDelegate> allClassTabelDelegate;
-(void)setIsGroup:(Boolean) isGroup;

@end
