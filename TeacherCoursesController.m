//
//  TeacherCoursesController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/13.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeacherCoursesController.h"

static NSString  * const PUBLICCELL = @"TeacherCourseCell";
@interface TeacherCoursesController ()

@end

@implementation TeacherCoursesController


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        _currentIndex = 0;
   
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    self.automaticallyAdjustsScrollViewInsets = NO;

}

-(void)addSubViews
{
    UIBarButtonItem *rightItem =  [[UIBarButtonItem alloc] initWithTitle:@"发布课程" style:UIBarButtonItemStylePlain target:self action:@selector(rightButton:)];
    rightItem.tag = 0;
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.title = @"课程设置";
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    
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
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 94;
    self.tableView.allowsSelection = NO; // We essentially implement our own selection
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // Makes the horizontal row seperator stretch the entire length of the table view

    [self.view addSubview:_tableView];
    
}

-(void)rightButton:(UIBarButtonItem *)sender
{
    [self.navigationController pushViewController:[PublishClassController new] animated:YES];
}

-(void)segMentClick:(UISegmentedControl *)segment
{
    _currentIndex = segment.selectedSegmentIndex;
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell selected at index path %ld", indexPath.row);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TeacherCourseCell *cell = (TeacherCourseCell *)[tableView dequeueReusableCellWithIdentifier:PUBLICCELL];
    
    if (cell == nil) {
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                 title:@"编辑"];
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                 title:@"删除"];
        
        cell = [[TeacherCourseCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:PUBLICCELL
                                  containingTableView:_tableView // Used for row height and selection
                                   leftUtilityButtons:nil
                                  rightUtilityButtons:rightUtilityButtons];
        cell.delegate = self;
    }

    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scroll view did begin dragging");
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set background color of cell here if you don't want white
}

#pragma mark - SWTableViewDelegate

- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"left button 0 was pressed");
            break;
        case 1:
            NSLog(@"left button 1 was pressed");
            break;
        case 2:
            NSLog(@"left button 2 was pressed");
            break;
        case 3:
            NSLog(@"left btton 3 was pressed");
        default:
            break;
    }
}

- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            NSLog(@"More button was pressed");
            UIAlertView *alertTest = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"More more more" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles: nil];
            [alertTest show];
            
            [cell hideUtilityButtonsAnimated:YES];
            break;
        }
        case 1:
        {
            // Delete button was pressed
//            NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
//            
//           
//            [self.tableView deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        }
        default:
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


@end
