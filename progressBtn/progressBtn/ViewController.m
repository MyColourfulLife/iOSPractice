//
//  ViewController.m
//  progressBtn
//
//  Created by 黄家树 on 2017/12/2.
//  Copyright © 2017年 黄家树. All rights reserved.
//

#import "ViewController.h"

#import "ProgressPlay.h"
#import "ProgressView.h"

@interface ViewController ()<ProgressPlayDelegate>
@property (weak, nonatomic) IBOutlet ProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *playstop;
@property(strong,nonatomic)ProgressPlay *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.player = [[ProgressPlay alloc]init];
    self.player.delegate = self;
    
    UIColor *tintColor = [UIColor greenColor];
//    [[ProgressView appearance]setTintColor:tintColor];
    _progressView.tintColor = tintColor;
    _progressView.trackColor = [UIColor grayColor];
    _progressView.startAngle = 3.0 * M_PI / 2.0;
}

- (IBAction)playAndPauseBtn:(UIButton *)sender {
    //如果选中改为未选中 并更改图片背景
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"Pause"] forState:UIControlStateNormal];
       [self.player play];
        
    } else {
        [sender setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
        [self.player pause];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) player:(ProgressPlay *)player didReachPosition:(float)position{
    _progressView.progess = position;
    NSLog(@">>>>>>>>>%f",position);
}

- (void) playerDidStop:(ProgressPlay *)player{
    _playstop.selected = NO;
    _progressView.progess = 0.0;
    [_playstop setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];

}

@end
