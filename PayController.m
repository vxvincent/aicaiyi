//
//  PayController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/29.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "PayController.h"
#import "PayStudentCell.h"
#import "BuyClassCell.h"
#import "PayMethodCell.h"
#import "PaySuccessController.h"


static NSString * const CELL1 = @"PayStudentCell";
static NSString * const CELL2 = @"BuyClassCell";
static NSString * const CELL3 = @"PayMethodCell";

@interface PayController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    [self.tableView registerNib:[UINib nibWithNibName:CELL1 bundle:nil] forCellReuseIdentifier:CELL1];
    [self.tableView registerNib:[UINib nibWithNibName:CELL2 bundle:nil] forCellReuseIdentifier:CELL2];
    [self.tableView registerNib:[UINib nibWithNibName:CELL3 bundle:nil] forCellReuseIdentifier:CELL3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (IBAction)payAction:(id)sender {
    PaySuccessController *psuccessVC = [PaySuccessController new];
    [self.navigationController pushViewController:psuccessVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1){
        return 1;
    } else {
        return 3;
    }
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"";
    } else if (section == 1){
        return @"";
    } else {
        return @"请选择支付方式";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PayStudentCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL1 forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 1) {
        BuyClassCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL2 forIndexPath:indexPath];
        return cell;
    } else {
        PayMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL3 forIndexPath:indexPath];
        return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    } else if (indexPath.section == 1) {
        return 169;
    } else {
        return 44;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    } else if (section == 1) {
        return 20;
    } else {
        return 30;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

@end
