//
//  HomeViewController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "HomeViewController.h"
#import "TeacherDetailController.h"

static NSString *consultCellId = @"ConsultCell";
static NSString *teachCellId = @"HomeTeacherViewCell";
static NSString *headCellID = @"HeadCell";
@interface HomeViewController ()

@end

@implementation HomeViewController

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
           }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
     self.view.backgroundColor = [UIColor whiteColor];
   
    [self.tableView registerNib:[UINib nibWithNibName:consultCellId bundle:nil] forCellReuseIdentifier:consultCellId];
     [self.tableView registerNib:[UINib nibWithNibName:consultCellId bundle:nil] forCellReuseIdentifier:consultCellId];
    [self.tableView registerNib:[UINib nibWithNibName:headCellID bundle:nil] forCellReuseIdentifier:headCellID];
    [self.tableView registerClass:[HomeTeacherViewCell class] forCellReuseIdentifier:teachCellId];
    [self getData];
}

#pragma mark - tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)stableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1){
        return 3;
    } else {
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HeadCell *head = [tableView dequeueReusableCellWithIdentifier:headCellID forIndexPath:indexPath];
   
        return head;
    } else if(indexPath.section == 1){
        ConsultCell * consul = [tableView dequeueReusableCellWithIdentifier:consultCellId forIndexPath:indexPath];
        return consul;
    } else {
        HomeTeacherViewCell * teach = [tableView dequeueReusableCellWithIdentifier:teachCellId forIndexPath:indexPath];
        return teach;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frameRect = CGRectMake(0, 0, 100, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:frameRect] ;
    label.text=@"   myTitle";
    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
     return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [HeadCell getHeight];
    } else if (indexPath.section == 1){
        return [ConsultCell getHeight];
    } else {
        return [HomeTeacherViewCell getHeight];
    }
}

#pragma mark - tableview点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [_delegate selectedWithItem:@"1" stringWithContent:@"音乐"];

    } else if (indexPath.section == 1){
        
    } else {
        TeacherDetailController *customHeader = [[TeacherDetailController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:customHeader];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }
  }

#pragma mark - 获取网络数据

-(void)getData
{
   [AFNetWorkTool HtmlWithGetUrl:@"http://www.cloudjoyclub.com/yunlehui/api.php?m=user&a=getRollPics" success:^(id responseObject) {
       NSDictionary *dic = [JsonUtils dictionaryWithId:responseObject];
       if (!dic) {
           return ;
       }
   } fail:^(NSError *error) {
       
   }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
