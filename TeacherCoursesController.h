//
//  TeacherCoursesController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublishClassController.h"
#import "TeacherCourseCell.h"

@interface TeacherCoursesController : UIViewController<UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate>
@property(strong,nonatomic) UITableView *tableView;
@property(assign,nonatomic) NSInteger currentIndex;
@end
