//
//  TeacherTableView.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeacherTableView.h"
static NSString *UseInfoCellID = @"UseInfoCell";
static NSString *SettingCellID = @"SettingCell";

@implementation TeacherTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {

        [self registerNib:[UINib nibWithNibName:UseInfoCellID bundle:nil] forCellReuseIdentifier:UseInfoCellID];
        [self registerNib:[UINib nibWithNibName:SettingCellID bundle:nil] forCellReuseIdentifier:SettingCellID];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [_teacherdelegate showEditTeacherInfo];
    } else if(indexPath.section == 1){
        
    } else if(indexPath.section == 2){
        if (indexPath.row == 2) {
            [_teacherdelegate showTeacherClass];
        }
    } else {
    
    }

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1){
        return 3;
    } else if (section == 2){
        return 4;
    } else {
        return 1;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //        （我的才艺秀、我的订单、我的消息）（教师认证、我的简历、课程设置、我的课表）（设置）
    if (indexPath.section == 0) {
        UseInfoCell *useinfocell = [self dequeueReusableCellWithIdentifier:UseInfoCellID forIndexPath:indexPath];
        return useinfocell;
    }else if (indexPath.section == 1){
        SettingCell *settingCell = [self dequeueReusableCellWithIdentifier:SettingCellID forIndexPath:indexPath];
        if (indexPath.row == 0) {
            settingCell.settingLabel.text = @"我的才艺秀";
        } else if (indexPath.row == 1) {
            settingCell.settingLabel.text = @"我的订单";
        } else {
            settingCell.settingLabel.text = @"我的消息";
        }
        return settingCell;
    }else if (indexPath.section == 2){
        SettingCell *settingCell = [self dequeueReusableCellWithIdentifier:SettingCellID forIndexPath:indexPath];
        if (indexPath.row == 0) {
            settingCell.settingLabel.text = @"教师认证";
        } else if (indexPath.row == 1) {
            settingCell.settingLabel.text = @"我的简历";
        } else if (indexPath.row == 2) {
            settingCell.settingLabel.text = @"课程设置";
        } else {
            settingCell.settingLabel.text = @"我的课表";
        }
        return settingCell;
    }else {
        SettingCell *settingCell = [self dequeueReusableCellWithIdentifier:SettingCellID forIndexPath:indexPath];
        settingCell.settingLabel.text = @"设置";
        return settingCell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [UseInfoCell getHeight];
    } else {
        return 40;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
    
}



@end
