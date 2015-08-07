//
//  TeachDetailLiveController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/9.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeachDetailLiveController.h"
#import "TeachDetailLive1Cell.h"
#import "TeachDetailLive2Cell.h"
#import "TeachDetailLive3Cell.h"

static NSString * const CELL1ID = @"TeachDetailLive1Cell";
static NSString * const CELL2ID = @"TeachDetailLive2Cell";
static NSString * const CELL3ID = @"TeachDetailLive3Cell";
@interface TeachDetailLiveController ()

@end

@implementation TeachDetailLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:CELL1ID bundle:nil] forCellReuseIdentifier:CELL1ID];
    [self.tableView registerNib:[UINib nibWithNibName:CELL2ID bundle:nil] forCellReuseIdentifier:CELL2ID];
    [self.tableView registerNib:[UINib nibWithNibName:CELL3ID bundle:nil] forCellReuseIdentifier:CELL3ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
}
-(NSString *)segmentTitle
{
    return @"经历";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    } else if (section == 1){
        return 2;
    } else {
        return 2;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TeachDetailLive1Cell *cell = [tableView dequeueReusableCellWithIdentifier:CELL1ID forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 1) {
        TeachDetailLive2Cell *cell = [tableView dequeueReusableCellWithIdentifier:CELL2ID forIndexPath:indexPath];
        cell.userInteractionEnabled = NO;
        if (indexPath.row == 0) {
            cell.headLineView.hidden = YES;
        } else {
            cell.headLineView.hidden = NO;
        }
        
        return cell;
    
    } else {
        TeachDetailLive3Cell *cell = [tableView dequeueReusableCellWithIdentifier:CELL3ID forIndexPath:indexPath];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 160.f;
    } else if (indexPath.section == 1){
        return 100.f;
    } else {
        return 100.f;
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
