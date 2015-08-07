//
//  StudentTableView.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/11.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "StudentTableView.h"
#import "UseInfoCell.h"
#import "SettingCell.h"

static NSString *UseInfoCellID = @"UseInfoCell";
static NSString *SettingCellID = @"SettingCell";


@implementation StudentTableView




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
        [self.studentdelegate showEditStudentInfo];
    } else if(indexPath.section == 1){
        if (indexPath.row == 1) {
            [self.studentdelegate showStudentOrder];
        }
    } else if(indexPath.section == 2){
        [self.studentdelegate showStudentClass];
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
        return 2;
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
    if (indexPath.section == 0) {
        UseInfoCell *useinfocell = [self dequeueReusableCellWithIdentifier:UseInfoCellID forIndexPath:indexPath];
        return useinfocell;
    }else if (indexPath.section == 1){
        SettingCell *settingCell = [self dequeueReusableCellWithIdentifier:SettingCellID forIndexPath:indexPath];
        return settingCell;
    }else if (indexPath.section == 1){
        SettingCell *settingCell = [self dequeueReusableCellWithIdentifier:SettingCellID forIndexPath:indexPath];
        return settingCell;
    }else {
        SettingCell *settingCell = [self dequeueReusableCellWithIdentifier:SettingCellID forIndexPath:indexPath];
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
