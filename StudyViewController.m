//
//  StudyViewController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "StudyViewController.h"
#import "MultilevelMenu.h"
#import "TeacherListController.h"
#import "AFNetWorkTool.h"
#import "HUDUtils.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface StudyViewController ()

@property(strong,nonatomic) MultilevelMenu * Mview;
@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigationBar];
    [self initView];
    
}

///设置显示view
-(void)initView{
    
    /**
     默认是 选中第一行
     
     :returns: return value description
     */
    _Mview=[[MultilevelMenu alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight) WithData:nil withSelectIndex:^(NSInteger left, NSInteger right,rightMeun* info) {
        
        if (right == -1) {
            rightMeun *leftMenu = [_Mview.allData objectAtIndex:left];
            [leftMenu.nextArray removeAllObjects];
            [_Mview.rightCollection reloadData];
            [self getData:[NSString stringWithFormat:@"%@m=user&a=couclass&subclass_id=%@",BASE_URL,leftMenu.ID] type:1];
           
        } else {
         
            TeacherListController *tlc = [[TeacherListController alloc] init];
            tlc.navigationItem.title = info.meunName;
            tlc.course_id = info.ID;
            [self.navigationController pushViewController:tlc animated:YES];
        }
        
        
    }];
    
    _Mview.needToScorllerIndex=0;
    _Mview.isRecordLastScroll=YES;
    [self.view addSubview:_Mview];
    [self getData:[NSString stringWithFormat:@"%@m=user&a=getGoodsCategory&class_name=%@",BASE_URL,@"音乐"] type:0];
}

///初始化导航栏
-(void)initNavigationBar{
    
    UISegmentedControl *segMent=[[UISegmentedControl alloc] initWithFrame:CGRectMake(70.0f, 5.0f, 180.0f, 34.0f) ];
    [segMent insertSegmentWithTitle:@"音乐" atIndex:0 animated:YES];
    [segMent insertSegmentWithTitle:@"美术" atIndex:1 animated:YES];
    [segMent insertSegmentWithTitle:@"体育" atIndex:2 animated:YES];
    segMent.momentary = NO;  //设置在点击后是否恢复原样
    segMent.multipleTouchEnabled=NO;  //可触摸
    segMent.selectedSegmentIndex =0;   //指定索引
    segMent.tintColor =[UIColor whiteColor];
    [segMent addTarget:self action:@selector(segMentClick:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segMent;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-search"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(pushSearchViewController)];
}

-(void)pushSearchViewController
{
    
    
}

#pragma mark - segment点击事件
-(void)segMentClick:(UISegmentedControl *)segment{
    if (segment.selectedSegmentIndex == 0) {
        [ self getData:[NSString stringWithFormat:@"%@m=user&a=getGoodsCategory&class_name=%@",BASE_URL,@"音乐"] type:0];
    } else if (segment.selectedSegmentIndex == 1){
        [self getData:[NSString stringWithFormat:@"%@m=user&a=getGoodsCategory&class_name=%@",BASE_URL,@"美术"] type:0];
    } else {
        [self getData:[NSString stringWithFormat:@"%@m=user&a=getGoodsCategory&class_name=%@",BASE_URL,@"体育"] type:0];
    }
    [_Mview.allData removeAllObjects];
    [_Mview.rightCollection reloadData];
    [_Mview.leftTablew reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)getData:(NSString *)url type:(NSInteger)type
{
    
    [AFNetWorkTool HtmlWithGetUrl:url success:^(NSDictionary *dic) {
        
        if (![[dic objectForKey:@"list"] isKindOfClass:[NSArray class]]) {
            return ;
        }
        NSArray *array = [dic objectForKey:@"list"];
        NSInteger size = [array count];
        if (type == 0) {
            for (int i = 0; i < size; i++) {
                rightMeun * meun=[[rightMeun alloc] init];
                meun.ID = [array[i] objectForKey:@"id"];
                meun.meunName = [array[i] objectForKey:@"subclass_name"];
                [_Mview.allData addObject:meun];
                if (i == 0) {
                    [self getData:[NSString stringWithFormat:@"%@m=user&a=couclass&subclass_id=%@",BASE_URL,meun.ID] type:1];
                }
            }
             [_Mview.leftTablew reloadData];
            
        } else {
            NSMutableArray * sub=[NSMutableArray arrayWithCapacity:0];
            rightMeun * meun1=[[rightMeun alloc] init];
            meun1.meunName=@"";
            [sub addObject:meun1];
            NSMutableArray *zList=[NSMutableArray arrayWithCapacity:0];
            for (int i = 0; i < size; i++) {
                rightMeun * meun2=[[rightMeun alloc] init];
                meun2.ID = [array[i] objectForKey:@"id"];
                meun2.meunName= [array[i] objectForKey:@"couclass_name"];
                [zList addObject:meun2];
            }
            meun1.nextArray=zList;
            rightMeun *menu = _Mview.allData[_Mview.selectIndex];
            menu.nextArray=sub;
            [_Mview.rightCollection reloadData];
        }
        
    } fail:^(NSString *message) {
        [HUDUtils showHUDWithTitle:message withView:self.navigationController.view];
    } error:^(NSError *e) {
        [HUDUtils showHUDWithTitle:@"请检查网络设置是否正常" withView:self.navigationController.view];
    }];
    
}

@end
