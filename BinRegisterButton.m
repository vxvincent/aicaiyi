//
//  BinRegisterButton.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/18.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "BinRegisterButton.h"

@implementation BinRegisterButton

#pragma -mark touche action
-(void)addToucheHandler:(TouchedDownBlock)touchHandler{
    _touchedDownBlock = [touchHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touched:(BinRegisterButton*)sender{
    if (_touchedDownBlock) {
        _touchedDownBlock(sender,sender.tag);
    }
}

#pragma -mark count down method
-(void)startWithSecond:(NSInteger)totalSecond
{
    _totalSecond = totalSecond;
    _second = totalSecond;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}

-(void)timerStart:(NSTimer *)theTimer {
    NSTimeInterval deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];

    _second = _totalSecond - (int)(deltaTime+0.5) ;
    
    
    if (_second< 0.0)
    {
        [self stop];
    }
    else
    {
     
        if (_didChangeBlock)
        {
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateNormal];
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateDisabled];
            
        }
        else
        {
            NSString *title = [NSString stringWithFormat:@"%ld秒",_second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
            
        }
    }
}

-(void)stop
{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                if (_didFinishedBlock)
                {
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateNormal];
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateDisabled];
                    
                }
                else
                {
                    [self setTitle:@"重新获取" forState:UIControlStateNormal];
                    [self setTitle:@"重新获取" forState:UIControlStateDisabled];
                    
                }
            }
        }
    }

}

#pragma -mark block
-(void)didChange:(DidChangeBlock)didChangeBlock{
    _didChangeBlock = [didChangeBlock copy];
}

-(void)didFinished:(DidFinishedBlock)didFinishedBlock{
    _didFinishedBlock = [didFinishedBlock copy];
}

@end
