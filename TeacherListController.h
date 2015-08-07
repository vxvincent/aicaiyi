//
//  TeacherListController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/16.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetWorkTool.h"

@interface TeacherListController : UIViewController

@property(nonatomic,strong)NSArray *firstData;
@property(nonatomic,strong)NSArray *secondData;
@property(nonatomic,strong)NSArray *thirdData;
@property(nonatomic,strong)NSString *course_id;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSInteger per_page;
@property(nonatomic,strong)NSMutableArray *data;

@end
