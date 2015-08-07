//
//  BinRegisterButton.h
//  aicaiyi
//
//  Created by 吴彬 on 15/6/18.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BinRegisterButton;

typedef NSString* (^DidChangeBlock)(BinRegisterButton *countDownButton,NSInteger second);
typedef NSString* (^DidFinishedBlock)(BinRegisterButton *countDownButton, NSInteger second);
typedef void (^TouchedDownBlock)(BinRegisterButton *countDownButton,NSInteger tag);

@interface BinRegisterButton : UIButton
{
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    TouchedDownBlock _touchedDownBlock;
}
@property(assign,nonatomic) NSInteger second;
@property(assign,nonatomic) NSInteger totalSecond;
@property(strong,nonatomic) NSTimer *timer;
@property(strong,nonatomic) NSDate *startDate;

-(void)addToucheHandler:(TouchedDownBlock)touchHandler;

-(void)didChange:(DidChangeBlock)didChangeBlock;
-(void)didFinished:(DidFinishedBlock)didFinishedBlock;
-(void)startWithSecond:(NSInteger)second;
-(void)stop;

@end
