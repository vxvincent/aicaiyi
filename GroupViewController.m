//
//  GroupViewController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "GroupViewController.h"
#import "UIColor+Util.h"
@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _shows = [[NSMutableArray alloc] init];
    [self addSubViews];
    [self getData];
   }


-(void)addSubViews
{
    ////添加segment
    UISegmentedControl *segMent = [[UISegmentedControl alloc] initWithFrame: CGRectMake(0, 66, self.view.frame.size.width, 40)];
    [segMent insertSegmentWithTitle:@"才艺秀" atIndex:0 animated:YES];
    [segMent insertSegmentWithTitle:@"资讯" atIndex:1 animated:YES];
    segMent.momentary = NO;
    segMent.multipleTouchEnabled = NO;
    segMent.selectedSegmentIndex = 0;
    segMent.tintColor = [UIColor themeColor];
    [segMent addTarget:self action:@selector(segMentClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segMent];
    ///添加collectionview
    self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 106, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.collectionView];
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.numColsPortrait = 2;
    self.collectionView.hidden = NO;
    ///添加tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 106, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.tableView];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.hidden = YES;
}

#pragma mark - PSCollectionViewDelegate and DataSource
- (NSInteger)numberOfViewsInCollectionView:(PSCollectionView *)collectionView {
    return [self.shows count];
}

- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView viewAtIndex:(NSInteger)index {
    NSDictionary *item = [self.shows objectAtIndex:index];
    
     ShowCell *v = (ShowCell *)[self.collectionView dequeueReusableView];
    if (!v) {
        v = [[ShowCell alloc] initWithFrame:CGRectZero];
    }
    
    [v fillViewWithObject:item];
    
    return v;
}

- (CGFloat)heightForViewAtIndex:(NSInteger)index {
    NSDictionary *item = [self.shows objectAtIndex:index];
    
    return [ShowCell heightForViewWithObject:item inColumnWidth:self.collectionView.colWidth];
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectView:(PSCollectionViewCell *)view atIndex:(NSInteger)index {
    //    NSDictionary *item = [self.items objectAtIndex:index];
    
    // You can do something when the user taps on a collectionViewCell here
}

#pragma mark - 获取网络数据
-(void)getData
{
    [AFNetWorkTool HtmlWithGetUrl:@"http://www.cloudjoyclub.com/yunlehui/api.php?m=user&a=getRollPics" success:^(id responseObject) {
        NSDictionary *dic = [JsonUtils dictionaryWithId:responseObject];
        NSArray *diclist = [dic objectForKey:@"list"];
        for (NSDictionary* dic in diclist) {
            SkillShow *show = [[SkillShow alloc] initWithDictionary:dic];
            
            [_shows addObject:show];
        }
        [_collectionView reloadData];
        if (!dic) {
            return ;
        }
    } fail:^(NSError *error) {
        
    }];
    
}


#pragma mark - segment点击事件
-(void)segMentClick:(UISegmentedControl *)segMent
{
    if (segMent.selectedSegmentIndex == 0) {
        self.collectionView.hidden = NO;
        self.tableView.hidden = YES;
    } else {
        self.collectionView.hidden = YES;
        self.tableView.hidden = NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
