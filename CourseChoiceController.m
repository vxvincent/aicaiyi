//
//  CourseChoiceController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CourseChoiceController.h"
#import "PayController.h"

static NSString * const BUYCELL1 = @"CourseChoiceCell";
static NSString * const BUYCELL2 = @"CourseMethodCell";
static NSString * const BUYCELL3 = @"CourseTimeChoiceCell";
static NSString * const BUYCELL4 = @"CourseAllTimeChoiceCell";

@interface CourseChoiceController ()

@end

@implementation CourseChoiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    [self initTableViewBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)addSubViews
{
    self.navigationItem.title = @"课程购买";
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
    [segment insertSegmentWithTitle:@"多人班课" atIndex:0 animated:NO];
    [segment insertSegmentWithTitle:@"一对一私课" atIndex:1 animated:NO];
    [segment setBackgroundImage:[UIImage imageNamed:@"segment_class_false"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"segment_class_false"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"segment_class_true"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName ,nil];
    
    [segment setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [segment setTitleTextAttributes:dic forState:UIControlStateSelected];
    segment.layer.borderWidth = 1;
    segment.layer.borderColor = [UIColor colorWithRed:234.f/255 green:234.f/255 blue:236.f/255 alpha:1].CGColor;
    segment.momentary = NO;
    segment.multipleTouchEnabled = NO;
    segment.tintColor = [UIColor whiteColor];
    
    [segment addTarget:self action:@selector(segMentClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    segment.selectedSegmentIndex = _currentIndex;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40)];
   
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 94;
    [self.tableView registerClass:[CourseTimeChoiceCell class] forCellReuseIdentifier:BUYCELL3];
    [self.tableView registerNib:[UINib nibWithNibName:BUYCELL1 bundle:nil] forCellReuseIdentifier:BUYCELL1];
    [self.tableView registerNib:[UINib nibWithNibName:BUYCELL2 bundle:nil] forCellReuseIdentifier:BUYCELL2];
    [self.tableView registerNib:[UINib nibWithNibName:BUYCELL4 bundle:nil] forCellReuseIdentifier:BUYCELL4];
    //self.tableView.allowsSelection = NO;
    //self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 40)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2/3-90, 0, 80, 40)];
    _priceLabel.text = @"￥0";
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.textAlignment = NSTextAlignmentRight;
    _priceLabel.font = [UIFont fontWithName:@"Helvetica" size:17.f];
    [view addSubview:_priceLabel];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2/3, 0, self.view.frame.size.width/3, 40)];
    [button setTitle:@"提交订单" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buyCourse:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
}

#pragma mark - 购买课程
-(void)buyCourse:(id)sender
{
    PayController *payVC = [PayController new];
    [self.navigationController pushViewController:payVC animated:YES];
    
}

-(void)rightButton:(UIBarButtonItem *)sender
{
   
}

-(void)segMentClick:(UISegmentedControl *)segment
{
    _currentIndex = segment.selectedSegmentIndex;
    [self.tableView reloadData];
}

#pragma mark - CourseAllTimeDelegate
-(void)value:(NSString *)value
{

}

#pragma mark - CourseChoiceDelegate
-(void)selectCell:(CourseChoiceCell *)cell withIsOpened:(BOOL)isOpened
{
    _isOpened = isOpened;
    if (!_isOpened) {
        CGRect frame=_tb.frame;
        frame.size.height=1;
        [_tb setFrame:frame];
        
    } else {
        CGRect frame=_tb.frame;
        frame.size.height=200;
        [_tb setFrame:frame];
    }
}

#pragma mark - menu
-(void) initTableViewBlock
{
    _isOpened=NO;
    _tb = [[TableViewWithBlock alloc] initWithFrame:CGRectMake(8, 55, 304, 1)];
    [self.view addSubview:_tb];
    [_tb initTableViewDataSourceAndDelegate:^NSInteger(UITableView *tableView,NSInteger section){
        return 5;
        
    } setCellForIndexPathBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        SelectionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SelectionCell"];
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"SelectionCell" owner:self options:nil]objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        [cell.lb setText:[NSString stringWithFormat:@"Select %ld",(long)indexPath.row]];
        return cell;
    } setDidSelectRowBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        SelectionCell *cell=(SelectionCell*)[tableView cellForRowAtIndexPath:indexPath];
        CourseChoiceCell *ccc = (CourseChoiceCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [ccc.openButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        [ccc.openButton setTitle:cell.lb.text forState:UIControlStateNormal];
//        [_openButton setTitle:cell.lb.text forState:UIControlStateNormal];
//        [_openButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    }];
    
    [_tb.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_tb.layer setBorderWidth:2];
    [self.tableView addSubview:_tb];
}


#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];

  

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_currentIndex == 0) {
        return 3;
    } else {
        return 4;
    }
  
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        switch (_currentIndex) {
        case 0:
                if (indexPath.row == 0) {
                    CourseChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:BUYCELL1 forIndexPath:indexPath];
                      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    cell.delegate = self;
                    return cell;
                } else if (indexPath.row == 1){
                    CourseTimeChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:BUYCELL3 forIndexPath:indexPath];
                      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    return cell;
                } else {
                    CourseAllTimeChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:BUYCELL4 forIndexPath:indexPath];
                      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    cell.delegate = self;

                    return cell;
                }

            break;
        case 1:
                if (indexPath.row == 0) {
                    CourseChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:BUYCELL1 forIndexPath:indexPath];
                      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    return cell;
                } else if (indexPath.row == 1){
                    CourseMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:BUYCELL2 forIndexPath:indexPath];
                      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    return cell;
                } else if (indexPath.row == 2) {
                    CourseTimeChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:BUYCELL3 forIndexPath:indexPath];
                      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    return cell;
                } else {
                    CourseAllTimeChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:BUYCELL4 forIndexPath:indexPath];
                      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    cell.delegate = self;

                    return cell;

                }

        default:
                return nil;
            break;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_currentIndex) {
        case 0:
            if (indexPath.row == 0) {
                return 65;
            } else if (indexPath.row == 1){
                return [CourseTimeChoiceCell getHeight];
            } else {
                return 44;
            }
            
            break;
        case 1:
            if (indexPath.row == 0) {
                return 65;
            } else if (indexPath.row == 1){
                return 65;
            } else if (indexPath.row == 2) {
                return [CourseTimeChoiceCell getHeight];
            } else {
                return 44;
                
            }
            
        default:
            return 44;
            break;
    }
}

@end
