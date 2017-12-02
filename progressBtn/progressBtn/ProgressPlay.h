//
//  ProgressPlay.h
//  progressBtn
//
//  Created by 黄家树 on 2017/12/2.
//  Copyright © 2017年 黄家树. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DURATION 10.0 //持续时间
#define PERIOD 0.2   //周期

@class ProgressPlay;
@protocol ProgressPlayDelegate <NSObject>
- (void) player:(ProgressPlay *)player didReachPosition:(float)position;
- (void) playerDidStop:(ProgressPlay *)player;
@end

@interface ProgressPlay : NSObject

@property(nonatomic ,strong)NSTimer *timer;
@property(assign) float position;

@property(retain) id<ProgressPlayDelegate>delegate;
-(void) play;
-(void) pause;
@end
