//
//  TeacherListController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/16.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeacherListController.h"
#import "UITeacherListCell.h"
#import "MJRefresh.h"
#import "Course.h"
#import "ImageLoad.h"
#import "TeacherDetailController.h"

static NSString * const TEACHERLISTCELLID = @"UITeacherListCell";
@interface TeacherListController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TeacherListController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        self.view.backgroundColor = [UIColor whiteColor];
        _per_page = 10;
        _data = [NSMutableArray new];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
}



-(void)initTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:TEACHERLISTCELLID bundle:nil] forCellReuseIdentifier:TEACHERLISTCELLID];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self setRefresh];
}

//开始刷新自定义方法
- (void)setRefresh
{
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    [self.tableView.header beginRefreshing];
    
}
//下拉刷新
- (void)headerRereshing
{
    _page = 1;
    self.tableView.tag = 0;
    [self getTeacherList];
    
    
}
//上拉加载
- (void)footerRereshing
{
    self.tableView.tag = 1;
    [self.tableView.footer endRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - tableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TeacherDetailController *customHeader = [[TeacherDetailController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:customHeader];
    [self.navigationController presentViewController:nav animated:YES completion:nil];


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITeacherListCell *teachCell = [tableView dequeueReusableCellWithIdentifier:TEACHERLISTCELLID forIndexPath:indexPath];
    Course *course = [_data objectAtIndex:indexPath.row];
    [ImageLoad imageLoadWithImage:teachCell.photoImage withUrl:course.photo];
    teachCell.courseNameLabel.text = course.course_name;
    teachCell.teachNameLabel.text = course.teacher_name;
    teachCell.teachAge.text = course.teacher_age;
    
    return teachCell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

///获取教师列表数据
-(void)getTeacherList
{
    NSString *url = [self getUrl];
    [AFNetWorkTool HtmlWithGetUrl:url success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        [self completeTableView];
        if (self.tableView.tag == 0) {
            [_data removeAllObjects];
        }
         [Course parseWithDic:dic addArray:_data];
        [self.tableView reloadData];
    } fail:^(NSString *message) {
        [self completeTableView];
    } error:^(NSError *e) {
        [self completeTableView];
    }];
}

-(void)completeTableView
{
    if (self.tableView.tag ==0) {
        [self.tableView.header endRefreshing];
    } else {
        [self.tableView.footer endRefreshing];
    }
    
}
-(NSString *)getUrl
{
    return [NSString stringWithFormat:@"%@m=user&a=teacher_list&page=%ld&per_page=%ld&couclass_id=%@",BASE_URL,_page,_per_page,_course_id];
}
@end
