//
//  TeacherTableView.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UseInfoCell.h"
#import "SettingCell.h"

@protocol TeacherTableViewDelegate <NSObject>

@required

@optional

-(void)showTeacherClass;
-(void)showEditTeacherInfo;

@end

@interface TeacherTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)id<TeacherTableViewDelegate> teacherdelegate;


@end
