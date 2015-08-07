//
//  StudentOrderController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/16.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "StudentOrderController.h"
static NSString * const order1 = @"StudentOrder1Cell";
static NSString * const order2 = @"StudentOrder2Cell";
static NSString * const order3 = @"StudentOrder3Cell";
static NSString * const order4 = @"StudentOrder4Cell";

@interface StudentOrderController ()<BinSegmentControlDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation StudentOrderController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的订单";
    [self addSubViews];
    [self.tableView registerNib:[UINib nibWithNibName:order1 bundle:nil] forCellReuseIdentifier:order1];
    [self.tableView registerNib:[UINib nibWithNibName:order2 bundle:nil] forCellReuseIdentifier:order2];
    [self.tableView registerNib:[UINib nibWithNibName:order3 bundle:nil] forCellReuseIdentifier:order3];
    [self.tableView registerNib:[UINib nibWithNibName:order4 bundle:nil] forCellReuseIdentifier:order4];
    
}

-(void)addSubViews
{
    NSArray *items = [NSArray arrayWithObjects:@"全部",@"待付款", @"进行中",@"待评价",nil];
    
    BinSegmentControl *segment = [[BinSegmentControl alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40) items:items];
    [segment colorWithSelBackgroundColor:[UIColor whiteColor] withSelTextColor:[UIColor redColor] withNoBackgroundColor:[UIColor lightGrayColor] withNoTextColor:[UIColor whiteColor]];
    segment.delegate = self;
    [self.view addSubview:segment];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height-40) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UItableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        StudentOrder1Cell *cell1 = [tableView dequeueReusableCellWithIdentifier:order1 forIndexPath:indexPath];
        return cell1;
    } else if (indexPath.row == 1){
        StudentOrder2Cell *cell2 = [tableView dequeueReusableCellWithIdentifier:order2 forIndexPath:indexPath];
        return cell2;
    } else {
        StudentOrder3Cell *cell3 = [tableView dequeueReusableCellWithIdentifier:order3 forIndexPath:indexPath];
        return cell3;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    } else if (indexPath.row == 1){
        return 98;
    } else {
        return 44;
    }

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

#pragma mark - BinSegmentControl delegate
-(void)segMentViewSelectIndex:(NSInteger)index
{
    

}

@end
