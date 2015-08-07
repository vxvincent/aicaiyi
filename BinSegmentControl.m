//
//  BinSegmentControl.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/15.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "BinSegmentControl.h"



@class BinSegmentItem;
///SegmentItem代理
@protocol BinSegmentItem <NSObject>

-(void)ItemStateChanged:(BinSegmentItem *)item index:(NSInteger)index isSelected:(BOOL) isSelected;

@end

///SegmentItem
@interface BinSegmentItem : UIView

@property(nonatomic ,strong) UIColor *noBackgroundColor;
@property(nonatomic ,strong) UIColor *selBackgroundColor;
@property(nonatomic ,strong) UIColor *noTextColor;
@property(nonatomic ,strong) UIColor *selTextColor;
@property(nonatomic ,strong) UILabel *titleLabel;
@property(nonatomic)         NSInteger index;
@property(nonatomic)         BOOL isSelected;
@property(nonatomic)         id   delegate;

@end

///SegmentItem实现
@implementation BinSegmentItem

- (id)initWithFrame:(CGRect)frame index:(NSInteger)index title:(NSString *)title isSelected:(BOOL)isSelected;
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _titleLabel.textAlignment   = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_titleLabel];
        ///设置默认颜色
        self.noBackgroundColor = [UIColor whiteColor];
        self.noTextColor = [UIColor blueColor];
        self.selBackgroundColor = [UIColor blueColor];
        self.selTextColor = [UIColor whiteColor];
        
        self.titleLabel.text = title;
        self.index           = index;
        self.isSelected      = isSelected;
    }
    return self;
}

-(void)colorWithSelBackgroundColor:(UIColor *)selBackgroundColor withSelTextColor:(UIColor *)selTextColor withNoBackgroundColor:(UIColor *)noBackgroundColor withNoTextColor:(UIColor *)noTextColor
{
    if (_selBackgroundColor != selBackgroundColor) {
        _selBackgroundColor = selBackgroundColor;
        _noBackgroundColor = noBackgroundColor;
        _selTextColor = selTextColor;
        _noTextColor = noTextColor;
        if (_isSelected) {
            self.backgroundColor = _selBackgroundColor;
            self.titleLabel.textColor = _selTextColor;
        
        } else {
            self.backgroundColor = _noBackgroundColor;
            self.titleLabel.textColor = _noTextColor;
        }
    }

}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (_isSelected) {
        self.titleLabel.textColor = _selTextColor;
        self.backgroundColor = _selBackgroundColor;
    } else {
        self.titleLabel.textColor = _noTextColor;
        self.backgroundColor = _noBackgroundColor;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.isSelected = !_isSelected;
    
    if (_delegate) {
        [_delegate ItemStateChanged:self index:self.index isSelected:self.isSelected];
    }

}

@end


///SegmentControl实现
@implementation BinSegmentControl

-(instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        _uLeftMargin = 0;
        _uItemHeight = frame.size.height;
        _uBorderLineWidth = 0;
        self.backgroundColor = [UIColor clearColor];
        float viewWidth = CGRectGetWidth(frame);
        float viewHeight = CGRectGetHeight(frame);
        float init_x = CGRectGetMinX(frame);
        float init_y = CGRectGetMinX(frame);
        
        //
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(_uLeftMargin, (viewHeight - _uItemHeight)/2, viewWidth -2*_uLeftMargin, _uItemHeight)];
        self.bgView.backgroundColor    = [UIColor whiteColor];
        self.bgView.clipsToBounds      = YES;
        self.bgView.layer.cornerRadius = 0;
        self.bgView.layer.borderWidth  = _uBorderLineWidth;
        self.bgView.layer.borderColor  = _noBackgroundColor.CGColor;
        [self addSubview:self.bgView];
        
        init_x = 0;
        init_y = 0;
        float itemWidth = CGRectGetWidth(self.bgView.frame)/items.count;
        float itemHeight = CGRectGetHeight(self.bgView.frame);
        if (items.count >= 2) {
            for (NSInteger i =0; i<items.count; i++) {
                BinSegmentItem *item = [[BinSegmentItem alloc] initWithFrame:CGRectMake(init_x, init_y, itemWidth, itemHeight) index:i title:items[i] isSelected:(i==0)?YES:NO];
              
                init_x += itemWidth;
                [self.bgView addSubview:item];
                item.delegate = self;
                
                //save all items
                if (!self.itemsArray) {
                    self.itemsArray = [[NSMutableArray alloc] initWithCapacity:items.count];
                }
                [self.itemsArray addObject:item];
            }
            
            //add Ver lines
//            init_x = 0;
//            for (NSInteger i = 0; i<items.count-1; i++) {
//                init_x += itemWidth;
//                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(init_x, 0, _uBorderLineWidth, itemHeight)];
//                lineView.backgroundColor = _noBackgroundColor;
//                [self.bgView addSubview:lineView];
//                
//                //save all lines
//                if (!self.linesArray) {
//                    self.linesArray = [[NSMutableArray alloc] initWithCapacity:items.count];
//                }
//                [self.linesArray addObject:lineView];
//            }
            
        }
        else
        {
            NSException *exc = [[NSException alloc] initWithName:@"items count error"
                                                          reason:@"items count at least 2"
                                                        userInfo:nil];
            @throw exc;
        }


    }
    return self;
}

-(void)colorWithSelBackgroundColor:(UIColor *)selBackgroundColor withSelTextColor:(UIColor *)selTextColor withNoBackgroundColor:(UIColor *)noBackgroundColor withNoTextColor:(UIColor *)noTextColor
{
    if (self.itemsArray.count < 2) {
        return ;
    }
    _noBackgroundColor = noBackgroundColor;
    _selBackgroundColor = selBackgroundColor;
    _noTextColor = noTextColor;
    _selTextColor = selTextColor;
    for (BinSegmentItem *item in _itemsArray) {
        [item colorWithSelBackgroundColor:_selBackgroundColor withSelTextColor:_selTextColor withNoBackgroundColor:_noBackgroundColor withNoTextColor:_noTextColor];
        [item setNeedsDisplay];
    }
    for (UIView *view in _linesArray) {
        view.backgroundColor = selBackgroundColor;
    }
}


#pragma mark - BinSegmentItem delegate
- (void)ItemStateChanged:(BinSegmentItem *)currentItem index:(NSInteger)index isSelected:(BOOL)isSelected
{
    if (self.itemsArray.count <2) {
        return;
    }
    
    for (int i =0; i<self.itemsArray.count; i++) {
        BinSegmentItem *item = self.itemsArray[i];
        item.isSelected = NO;
    }
    currentItem.isSelected = YES;
    
    if (_delegate && [_delegate respondsToSelector:@selector(segMentViewSelectIndex:)])
    {
        [_delegate segMentViewSelectIndex:index];
    }
}


@end
