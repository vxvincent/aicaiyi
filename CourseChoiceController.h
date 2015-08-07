//
//  CourseChoiceController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+DataSourceBlocks.h"
#import <QuartzCore/QuartzCore.h>
#import "SelectionCell.h"
#import "UITableView+DataSourceBlocks.h"
#import "TableViewWithBlock.h"
#import "CourseChoiceCell.h"
#import "CourseMethodCell.h"
#import "CourseTimeChoiceCell.h"
#import "CourseAllTimeChoiceCell.h"

@interface CourseChoiceController : UIViewController <UITableViewDataSource,UITableViewDelegate,CourseChoiceCellDelegate,CourseAllTimeDelegate>

@property(strong,nonatomic) UITableView *tableView;
@property(assign,nonatomic) NSInteger currentIndex;
@property(strong, nonatomic)TableViewWithBlock *tb;
@property(assign,nonatomic)   BOOL isOpened;
@property(strong,nonatomic) UILabel *priceLabel;

@end
