//
//  PublishClassController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/23.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "PublishClassController.h"
#import "EditIntoCell.h"
#import "UIColor+Util.h"
#import "CategoryController.h"
#import "CourseCategory.h"
#import "CourseNameController.h"
#import "CourseTimeController.h"
#import "CourseAddressController.h"
#import "CourseNumController.h"
#import "CoursePriceController.h"
#import "AllClassTableCell.h"
#import "ClassTableCollection.h"
#import "AFNetWorkTool.h"
#import "HUDUtils.h"

static NSString * const EDITINTOCELL = @"EditIntoCell";
static NSString * const ALLCLASSTABELCELL = @"AllClassTableCell";

@interface PublishClassController ()<AllClassTabelDelegate>

@end

@implementation PublishClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    self.parameters = [[NSMutableDictionary alloc] init];
    _infos = [[NSMutableArray alloc] initWithObjects:@"科目",@"课程类型",@"课程名称",@"课程时长",@"上课地址",@"学员人数",@"学费",@"试听名额",@"试听费用",@"授课时间",@"照片\\视频", nil];
    [self.tableView registerNib:[UINib nibWithNibName:EDITINTOCELL bundle:nil] forCellReuseIdentifier:EDITINTOCELL];
    [self.tableView registerClass:[AllClassTableCell class] forCellReuseIdentifier:ALLCLASSTABELCELL];
}

-(void)addSubViews
{
    self.navigationItem.title = @"发布课程";
    int height = 40;
    int edge = 0;
    UIButton *saveButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-height-edge, self.view.frame.size.width/2, height)];
    saveButton.backgroundColor = [UIColor whiteColor];
    [saveButton setTitle:@"保存课程" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor themeColor] forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveClass:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *publishButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height-height-edge, self.view.frame.size.width/2, height)];
    publishButton.backgroundColor = [UIColor themeColor];
    [publishButton setTitle:@"发布课程" forState:UIControlStateNormal];
    [publishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];[publishButton addTarget:self action:@selector(publishClass:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-height-edge-64);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:saveButton];
    [self.view addSubview:publishButton];
    [self.view addSubview:self.tableView];
}

///保存课程
-(void)saveClass:(id)sender
{
    
}

///发布课程
-(void)publishClass:(id)sender
{
    
 
    [_parameters setObject:_course_id forKey:@"couclass_id"];
    [_parameters setObject:_course_name forKey:@"course_name"];
    [_parameters setObject:[NSString stringWithFormat:@"%ld",_course_category] forKey:@"class_mode"];
    [_parameters setObject:_courese_address forKey:@"class_address"];
    [_parameters setObject:_course_price forKey:@"price "];
    [_parameters setObject:_course_test_num forKey:@"audition_places"];
    [_parameters setObject:_course_test_price forKey:@"audition_amount"];
    [_parameters setObject:_course_week forKey:@"week"];
    [_parameters setObject:@"1" forKey:@"in_teacher_room"];
    [_parameters setObject:_course_num forKey:@"students_num"];
    [_parameters setObject:@"1" forKey:@"testable"];
     MBProgressHUD *hud = [HUDUtils createHUD];
    hud.labelText = @"正在上传";
    [AFNetWorkTool PostWithUrl:[NSString stringWithFormat:@"%@%@",BASE_URL,@"m=user&a=course"] parameters:_parameters filePaths:nil success:^(NSDictionary *dic) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"上传成功";
        [hud hide:YES afterDelay:1];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^(NSString *message) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"上传失败";
        [hud hide:YES afterDelay:1];
    } error:^(NSError *e) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"请检查网络";
        [hud hide:YES afterDelay:1];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - AllClassTabelCell 代理
-(void)setSelectedAllClass:(NSIndexPath *)indexPath result:(NSString *)result
{
    _course_week = result;
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _infos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.row == 0) {
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = _course;
        return cell;
        
    } else if (indexPath.row == 1){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        if (_course_category == 0) {
            cell.contentLabel.text = @"一对一";
        } else {
            cell.contentLabel.text = @"一对多";
        }
        return cell;
        
    } else if (indexPath.row == 2){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = _course_name;
        return cell;
    } else if (indexPath.row == 3){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = [NSString stringWithFormat:@"%@时",_course_time];
        return cell;
    } else if (indexPath.row == 4){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = _courese_address;
        return cell;
    } else if (indexPath.row == 5){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = [NSString stringWithFormat:@"%@人",_course_num];
        return cell;
    } else if (indexPath.row == 6){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = [NSString stringWithFormat:@"%@元",_course_price];
        return cell;
    } else if (indexPath.row == 7){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = [NSString stringWithFormat:@"%@人",_course_test_num];
        return cell;
    } else if (indexPath.row == 8){
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        cell.contentLabel.text = [NSString stringWithFormat:@"%@元",_course_test_price];
        return cell;
    } else if (indexPath.row == 9){
        
        AllClassTableCell *classCell = [tableView dequeueReusableCellWithIdentifier:ALLCLASSTABELCELL forIndexPath:indexPath];
        classCell.allClassTabelDelegate = self;
        [classCell setIsGroup:true];
        return classCell;
    } else {
        EditIntoCell *cell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELL forIndexPath:indexPath];
        cell.titleLabel.text = [_infos objectAtIndex:indexPath.row];
        return cell;
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        //选择科目
        CategoryController *category = [[CategoryController alloc] init];
        [category addCategoryBlock:^(NSString *couclassid, NSString *firstname, NSString *thirdname) {
            _course_id = couclassid;
            _course = [NSString stringWithFormat:@"%@-%@",firstname,thirdname];
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:category animated:YES];
    } else if (indexPath.row == 1) {
        //课程类型
        CourseCategory *course = [[CourseCategory alloc] init];
        [course addCourseCategoryBlock:^(NSInteger cc) {
            _course_category = cc;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:course animated:YES];
    } else if (indexPath.row == 2){
        //课程名
        CourseNameController *cnc = [CourseNameController new];
        [cnc addCourseNameBlock:^(NSString *name) {
            _course_name = name;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:cnc animated:YES];
    } else if (indexPath.row == 3){
        //课程时长
        CourseTimeController *ctc = [CourseTimeController new];
        [ctc addCourseTimeBlcok:^(NSString *time) {
            _course_time = time;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:ctc animated:YES];
    } else if (indexPath.row == 4){
        //上课地址
        CourseAddressController *cac = [CourseAddressController new];
        [cac addCourseAddressBlock:^(NSString *address) {
            _courese_address = address;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:cac animated:YES];
    } else if (indexPath.row == 5) {
        //上课人数
        CourseNumController *cnc = [CourseNumController new];
        cnc.navigationItem.title = @"学员人数";
        [cnc addCourseNumBlcok:^(NSString *time) {
            _course_num = time;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:cnc animated:YES];
    } else if (indexPath.row == 6){
        //学费
        CoursePriceController *cpc = [CoursePriceController new];
        cpc.navigationItem.title = @"学费";
        [cpc addCoursePriceBlock:^(NSString *price) {
            _course_price = price;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:cpc animated:YES];
    } else if (indexPath.row == 7){
        //试听费用人数
        CourseNumController *cnc = [CourseNumController new];
        cnc.navigationItem.title = @"试听名额";
        [cnc addCourseNumBlcok:^(NSString *time) {
            _course_test_num = time;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:cnc animated:YES];
    } else if (indexPath.row == 8) {
        //试听费用
        CoursePriceController *cpc = [CoursePriceController new];
        cpc.navigationItem.title = @"试听费用";
        [cpc addCoursePriceBlock:^(NSString *price) {
            _course_test_price = price;
            [_tableView reloadData];
        }];
        [self.navigationController pushViewController:cpc animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 9) {
        return [AllClassTableCell getHeight];
    } else {
        return 44;
    }
    
}

@end
