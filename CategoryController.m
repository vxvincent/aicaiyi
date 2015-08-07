//
//  CategoryController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/23.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "CategoryController.h"
#import "CategoryCell.h"
#import "AFNetWorkTool.h"
#import "Urls.h"

static NSString * const CATEGORYCELL = @"CategoryCell";
@interface CategoryController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic) NSString * firstname;
@property(strong,nonatomic) NSString * secondname;
@property(strong,nonatomic) NSString * thirdname;
@end

@implementation CategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"科目";
    CGFloat y = 64.0;
    _firstArray = [[NSMutableArray alloc] init];
    _secondArray = [[NSMutableArray alloc] init];
    _thirdArray = [[NSMutableArray alloc] init];
    _firstTable = [[UITableView alloc] initWithFrame:CGRectMake(0, y, self.view.frame.size.width*0.2, self.view.frame.size.height)];
    _secondTable = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.2, y, self.view.frame.size.width*0.3, self.view.frame.size.height)];
    _thirdTable = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.5, y, self.view.frame.size.width*0.5, self.view.frame.size.height)];
    [_firstTable registerNib:[UINib nibWithNibName:CATEGORYCELL bundle:nil] forCellReuseIdentifier:CATEGORYCELL];
    [_secondTable registerNib:[UINib nibWithNibName:CATEGORYCELL bundle:nil] forCellReuseIdentifier:CATEGORYCELL];
    [_thirdTable registerNib:[UINib nibWithNibName:CATEGORYCELL bundle:nil] forCellReuseIdentifier:CATEGORYCELL];
    
    _firstTable.delegate = self;
    _firstTable.dataSource = self;
    _secondTable.delegate = self;
    _secondTable.dataSource = self;
    _thirdTable.delegate = self;
    _thirdTable.dataSource = self;
    [self.view addSubview:_firstTable];
    [self.view addSubview:_secondTable];
    [self.view addSubview:_thirdTable];
    [self getCategoryHttp:[NSString stringWithFormat:@"%@%@", BASE_URL,GETCATEGORY] withInt:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _firstTable) {
        return _firstArray.count;
    } else if (tableView == _secondTable) {
        return _secondArray.count;
    } else {
        return _thirdArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CATEGORYCELL forIndexPath:indexPath];
    cell.label.textColor = [UIColor blackColor];
    cell.label.highlightedTextColor = [UIColor colorWithRed:255.0/255 green:182.0/255 blue:2.0/255 alpha:1];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    if (tableView == _firstTable) {
        cell.label.text = [_firstArray[indexPath.row] objectForKey:@"class_name"];
        cell.contentView.backgroundColor = [UIColor colorWithRed:234.0/255  green:234.0/255 blue:236.0/255 alpha:1];
    } else if (tableView == _secondTable) {
        cell.label.text = [_secondArray[indexPath.row] objectForKey:@"subclass_name"];
        cell.contentView.backgroundColor = [UIColor colorWithRed:245.0/255  green:245.0/255 blue:245.0/255 alpha:1];
    } else {
        cell.label.text = [_thirdArray[indexPath.row] objectForKey:@"couclass_name"];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _firstTable) {
        [self getCategoryHttp:[NSString stringWithFormat:@"%@%@&class_name=%@", BASE_URL,GETCATEGORY,[_firstArray[indexPath.row] objectForKey:@"class_name"]] withInt:1];
        _firstname = [_firstArray[indexPath.row] objectForKey:@"class_name"];
    } else if (tableView == _secondTable) {
        [self getCategoryHttp:[NSString stringWithFormat:@"%@%@&subclass_id=%@", BASE_URL,COUCLASS,[_secondArray[indexPath.row] objectForKey:@"id"]] withInt:2];
      _secondname =  [_secondArray[indexPath.row] objectForKey:@"subclass_name"];
    } else {
        _thirdname = [_thirdArray[indexPath.row] objectForKey:@"couclass_name"];
        _categoryBlock([[_thirdArray objectAtIndex:indexPath.row] objectForKey:@"id"],
                     _firstname,_thirdname);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)getCategoryHttp:(NSString*) url withInt:(int) type
{
    [AFNetWorkTool HtmlWithGetUrl:url success:^(NSDictionary *dic) {
        BOOL isArray =  [[dic objectForKey:@"list"] isKindOfClass:[NSArray class]];
        
        if (!isArray) {
            if (type == 0) {
                [_firstArray removeAllObjects];
                [_firstTable reloadData];
            } else if (type == 1) {
                [_secondArray removeAllObjects];
                [_secondTable reloadData];
            } else {
                [_thirdArray removeAllObjects];
                [_thirdTable reloadData];
            }
            return ;
        }
        if (type == 0) {
            [_firstArray removeAllObjects];
            [_firstArray addObjectsFromArray:[dic objectForKey:@"list"]];
            [_firstTable reloadData];
        } else if (type == 1) {
            [_secondArray removeAllObjects];
            [_secondArray addObjectsFromArray:[dic objectForKey:@"list"]];
            [_secondTable reloadData];
            
        } else {
            [_thirdArray removeAllObjects];
            [_thirdArray addObjectsFromArray:[dic objectForKey:@"list"]];
            [_thirdTable reloadData];
        }
    } fail:^(NSString *message) {
        
    } error:^(NSError *e) {
        
    }];
}

-(void)addCategoryBlock:(CategoryBlock)block
{
    _categoryBlock = [block copy];
}

@end
