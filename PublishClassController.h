//
//  PublishClassController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/23.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublishClassController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray *infos;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSString *course_id;
@property(nonatomic,strong) NSString *course;
@property(nonatomic,assign) NSInteger course_category;
@property(nonatomic,assign) NSInteger course_mode;
@property(nonatomic,strong) NSString *course_name;
@property(nonatomic,strong) NSString *course_time;
@property(nonatomic,strong) NSString *courese_address;
@property(nonatomic,strong) NSString *course_num;
@property(nonatomic,strong) NSString *course_price;
@property(nonatomic,strong) NSString *course_test_num;
@property(nonatomic,strong) NSString *course_test_price;
@property(nonatomic,strong) NSMutableDictionary *parameters;
@property(nonatomic,strong) NSMutableDictionary *filePaths;
@property(nonatomic,strong) NSString *course_week;
@end
