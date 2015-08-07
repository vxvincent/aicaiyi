//
//  MeViewController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "MeViewController.h"
#import "EditUserInfoController.h"
#import "TeacherCoursesController.h"

@interface MeViewController ()<TeacherTableViewDelegate,StudentTableDelegate>

@property(strong,nonatomic) StudentTableView *studentTab;
@property(strong,nonatomic) TeacherTableView *teacherTab;
@property(strong,nonatomic) UIBarButtonItem *rightItem;

@end

@implementation MeViewController

-(void)viewWillAppear:(BOOL)animated
{


}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_isreFresh) {
        
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addSubViews{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _rightItem =  [[UIBarButtonItem alloc] initWithTitle:@"我是老师" style:UIBarButtonItemStylePlain target:self action:@selector(rightButton:)];
    _rightItem.tag = 0;
    self.navigationItem.rightBarButtonItem = _rightItem;
  
    _studentTab = [[StudentTableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-44-49-20) style:UITableViewStyleGrouped];
    [self.view addSubview:_studentTab];
    _studentTab.hidden = NO;
    _studentTab.studentdelegate = self;
    _teacherTab = [[TeacherTableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-44-49-20) style:UITableViewStyleGrouped];
    [self.view addSubview:_teacherTab];
    _teacherTab.teacherdelegate = self;
    _teacherTab.hidden = YES;
}

-(void)rightButton:(UIBarButtonItem *)sender
{
    if (sender.tag == 0) {
        [sender setTitle:@"我是学生"];
        sender.tag = 1;
        _studentTab.hidden = YES;
        _teacherTab.hidden = NO;
    } else {
        [sender setTitle:@"我是老师"];
        sender.tag =0;
        _studentTab.hidden = NO;
        _teacherTab.hidden = YES;

    }
}

#pragma mark - TeacherDelegate
-(void)showTeacherClass
{
    TeacherCoursesController *classController = [TeacherCoursesController new];
 
    [self.navigationController pushViewController:classController animated:YES];
}
-(void)showEditTeacherInfo
{
    EditUserInfoController *euic = [[EditUserInfoController alloc] init];
    [self.navigationController pushViewController:euic animated:YES];
}

#pragma mark - StudentDelegate
-(void)showStudentClass
{
    MyClassController *myClass = [[MyClassController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:myClass animated:YES];

}
-(void)showStudentOrder
{
    StudentOrderController *sOrder = [[StudentOrderController alloc] init];
    [self.navigationController pushViewController:sOrder animated:YES];

}

-(void)showEditStudentInfo
{
    EditUserInfoController *euic = [[EditUserInfoController alloc] init];
    [self.navigationController pushViewController:euic animated:YES];
}





@end
