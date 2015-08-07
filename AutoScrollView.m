//
//  AutoScrollView.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/5.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "AutoScrollView.h"
#import "UIImageView+WebCache.h"

@interface AutoScrollView() <UIScrollViewDelegate>

////分页
@property (nonatomic,weak) UIPageControl *pageControl;

@end

@implementation AutoScrollView

+(instancetype)createView
{
    return [[self alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(void)setPics:(NSMutableArray *)pics
{
    _pics = pics;
    // 1 添加滚动视图
    [self addScrollView];
    
    // 2 添加pageControl
    [self addPageControl];
}

-(void)initAutoScrollView:(NSMutableArray *)pics andAuTo:(BOOL)autoScroll
{
    // 1 添加滚动视图
    [self addScrollView];
    
    // 2 添加pageControl
    [self addPageControl];
}

///添加pageControl
-(void)addPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    // 设置frame
    CGFloat pageControlH = 30;
    CGFloat pageControlY = self.frame.size.height - pageControlH;
    pageControl.frame = CGRectMake(0, pageControlY, self.frame.size.width, pageControlH);
    // 设置个数
    pageControl.numberOfPages = self.pics.count;
    // 禁止点击滚动
    pageControl.enabled = NO;
    pageControl.backgroundColor = [UIColor clearColor];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}


#pragma mark - UIScrollViewDelegate
/**
 *  停止减速
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if([scrollView isMemberOfClass:[UIScrollView class]])
    {
        NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
        self.pageControl.currentPage = currentPage;
//        scrollView.contentOffset = CGPointMake(currentPage*scrollView.frame.size.width, 0);
        
    }
}

/**
 *  添加轮播视图
 */
- (void)addScrollView
{
    // 1. 创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    scrollView.delegate = self;
    [self addSubview:scrollView];
    
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * (_pics.count), self.frame.size.height);
    // 2. 图像视图加到滚动视图中
    [_pics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake( self.frame.size.width*idx,-64, scrollView.frame.size.width, scrollView.frame.size.height)];
        [scrollView addSubview:imageV];
        [imageV sd_setImageWithURL:[[NSURL alloc] initWithString:obj]];
        
    }];
    // 3. 设置滚动视图属性
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    //位移量
//    [scrollView setContentOffset:CGPointMake(0, 0)];
}


@end
