//
//  CourseChoiceCell.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>




@class CourseChoiceCell;

@protocol CourseChoiceCellDelegate <NSObject>
-(void)selectCell:(CourseChoiceCell *)cell withIsOpened:(BOOL) isOpened;
//-(void)showTableViewBlock:(TableViewWithBlock *)tb withCell:(CourseChoiceCell *)cell;
@end

@interface CourseChoiceCell : UITableViewCell
@property(assign,nonatomic)   BOOL isOpened;
@property(nonatomic,strong)id<CourseChoiceCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *openButton;

@end
