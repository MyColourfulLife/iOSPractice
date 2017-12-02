//
//  ProgressPlay.m
//  progressBtn
//
//  Created by 黄家树 on 2017/12/2.
//  Copyright © 2017年 黄家树. All rights reserved.
//

#import "ProgressPlay.h"

@implementation ProgressPlay

-(void)play{
    //启动定时器
    if (_timer) {
        return ;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:PERIOD target:self selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
}

-(void)pause{
    [_timer invalidate];
    _timer = nil;
}

-(void) timerDidFire:(NSTimer *)timer{
    if (self.position >= 1.0) {
        self.position = 0.0;
        [self pause];
        [self.delegate playerDidStop:self];
    } else {
        self.position += PERIOD/DURATION;
        [self.delegate player:self didReachPosition:self.position];
    }
}

@end
