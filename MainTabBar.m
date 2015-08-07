//
//  MainTabBar.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "MainTabBar.h"
#import "HomeViewController.h"
#import "StudyViewController.h"
#import "GroupViewController.h"
#import "MeViewController.h"

@interface MainTabBar ()<HomeDelagate,LoginDelegate>

@end

@implementation MainTabBar


- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *home = [[HomeViewController alloc] init];
    StudyViewController *study = [[StudyViewController alloc] init];
    GroupViewController *group = [[GroupViewController alloc] init];
    MeViewController *me = [[MeViewController alloc] init];
 
    home.delegate = self;
    home.navigationItem.title = @"首页";
    me.navigationItem.title = @"我的";
    //TabBar设置不透明
    self.tabBar.translucent = NO;
    self.viewControllers = @[[self addUIViewController:home indexPath:0],
                             [self addUIViewController:study indexPath:1],
                             [self addUIViewController:group indexPath:2],
                             [self addUIViewController:me indexPath:3]];

    NSArray *titles = @[@"首页",@"学才艺",@"才艺群",@"我"];
    NSArray *images = @[@"tabbar_home", @"tabbar_study",@"tabbar_group", @"tabbar_me"];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item,NSUInteger idx,BOOL *stop){
        item.title = titles[idx];

        [item setImage:[UIImage imageNamed:images[idx]]];
        UIImage *image = [[UIImage imageNamed:[images[idx] stringByAppendingString:@"_y"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        [item setSelectedImage:image];
        item.tag = idx;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///添加viewcontroller
-(UIViewController *)addUIViewController:(UIViewController *)controller indexPath:(int)index
{
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];

    return navigation;
}

#pragma mark - HomeViewController代理
-(void)selectedWithItem:(NSString *)cId stringWithContent:(NSString *)content
{
    self.selectedIndex = 1;

}

#pragma mark - TabBarDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{

    if (item.tag == 3 && ![Config getInstance].isLogin) {
        LoginController *login = [[LoginController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
        login.delegate = self;
        [((UINavigationController *)self.selectedViewController) presentViewController:nav animated:YES completion:nil];
        
    } else {
        _tag = item.tag;
    }

}

#pragma mark- LoginController代理
-(void)loginWithIslogin:(BOOL)isLogin
{
    if (!isLogin) {
        self.selectedIndex = _tag;
    }
}



@end
