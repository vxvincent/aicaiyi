//
//  TeacherDetailController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "TeacherDetailController.h"
#import "TeachDetailController.h"
#import "TeachDetailLiveController.h"
#import "TeacherDetailHeader.h"
#import "TeachDetailShowController.h"
#import "CourseChoiceController.h"

void *TeacherHeaderInset = &TeacherHeaderInset;

@interface TeacherDetailController ()
@property(strong,nonatomic)TeacherDetailHeader *tdh;
@end

@implementation TeacherDetailController


-(instancetype)init
{
    TeachDetailController *pclass = [TeachDetailController new];
    TeachDetailLiveController *live = [TeachDetailLiveController new];
    TeachDetailShowController *show = [TeachDetailShowController new];
    self = [super initWithControllers:pclass,live,show, nil];
    if (self) {
        self.segmentMiniTopInset = 64;
        
    }
    
    return self;
}

-(void)setNavigation:(NSString *)imageName{
    
    [self addObserver:self forKeyPath:@"segmentToInset" options:NSKeyValueObservingOptionNew context:TeacherHeaderInset];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = back;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor redColor];
    
}
//back
-(void)back:(id)sender
{
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addButton];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self setNavigation:@"navigation_bar_background_trans.png"];
   
}


-(void)addButton
{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 40)];
    UIButton * conBtn= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 40)];
    [conBtn setBackgroundColor:[UIColor whiteColor]];
    [conBtn setTitle:@"在线咨询" forState:UIControlStateNormal];
    [conBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [conBtn addTarget:self action:@selector(buyClass:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *buyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, 40)];
    [buyBtn setBackgroundColor:[UIColor redColor]];
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(talkTeacher:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:buyBtn];
    [view addSubview:conBtn];
    
    [self.view addSubview:view];
}


#pragma mark - 购买课程
-(void)buyClass:(id)sender
{
   
}

#pragma mark - 在线咨询
-(void)talkTeacher:(id)sender
{
    CourseChoiceController *ccc = [CourseChoiceController new];
    [self setNavigation:@"red_back"];
    [self.navigationController pushViewController:ccc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - override
-(UIView<ARSegmentPageControllerHeaderProtocol> *)customHeaderView
{
    _tdh = [[TeacherDetailHeader alloc] init];
    self.headerHeight = _tdh.height;
 
    return _tdh;
}

#pragma mark - kvc
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    if (context == TeacherHeaderInset) {
        CGFloat inset = [change[NSKeyValueChangeNewKey] floatValue];
        NSLog(@"inset is %f",inset);
        
    }
}


@end
