//
//  BinSegmentControl.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/15.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  BinSegmentControlDelegate<NSObject>

@required

@optional

-(void) segMentViewSelectIndex:(NSInteger)index;

@end


@interface BinSegmentControl : UIView

 

-(instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items;

@property(nonatomic ,strong) UIView *bgView;
@property(nonatomic ,strong) NSMutableArray *titlesArray;
@property(nonatomic ,strong) NSMutableArray *itemsArray;
@property(nonatomic ,strong) NSMutableArray *linesArray;

@property(nonatomic ,strong) UIColor *noBackgroundColor;
@property(nonatomic ,strong) UIColor *selBackgroundColor;
@property(nonatomic ,strong) UIColor *noTextColor;
@property(nonatomic ,strong) UIColor *selTextColor;

@property(nonatomic, assign) float uBorderLineWidth;
@property(nonatomic, assign) float uItemHeight;
@property(nonatomic, assign) float uLeftMargin;

@property(nonatomic) id<BinSegmentControlDelegate> delegate;

-(void)colorWithSelBackgroundColor:(UIColor *)selBackgroundColor withSelTextColor:(UIColor *)selTextColor withNoBackgroundColor:(UIColor *)noBackgroundColor withNoTextColor:(UIColor *)noTextColor;

@end
