//
//  TeachDetailController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeachDetailController.h"


static NSString * const CELL1ID = @"TeacherDetailClass1Cell";
static NSString * const CELL2ID = @"TeacherDetailClass2Cell";
static NSString * const CELL3ID = @"TeacherDetailClass3Cell";
@interface TeachDetailController ()

@end

@implementation TeachDetailController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:CELL1ID bundle:nil] forCellReuseIdentifier:CELL1ID];
    [self.tableView registerClass:[TeacherDetailClass2Cell class] forCellReuseIdentifier:CELL2ID];
    [self.tableView registerNib:[UINib nibWithNibName:CELL3ID bundle:nil] forCellReuseIdentifier:CELL3ID];
}

-(NSString *)segmentTitle
{
    return @"课程";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1){
        return 1;
    } else {
        return 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TeacherDetailClass1Cell *cell = [tableView dequeueReusableCellWithIdentifier:CELL1ID forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 1){
        TeacherDetailClass2Cell *cell = [tableView dequeueReusableCellWithIdentifier:CELL2ID forIndexPath:indexPath];
        return cell;
    } else {
        TeacherDetailClass3Cell *cell = [tableView dequeueReusableCellWithIdentifier:CELL3ID forIndexPath:indexPath];
        return cell;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return  75;
    } else if (indexPath.section == 1){
        return [TeacherDetailClass2Cell getHeight];
    } else {
        return 157;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 60;
    }
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
