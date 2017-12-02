//
//  ProgressView.m
//  progressBtn
//
//  Created by 黄家树 on 2017/12/2.
//  Copyright © 2017年 黄家树. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

+(Class)layerClass{
    return [ProgressLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initIvars];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initIvars];
    }
    return self;
}

-(void)initIvars{
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;//设置不透明 提高渲染
    self.tintColor = [UIColor colorWithRed:0.2 green:0.45 blue:0.8 alpha:1.0];
    self.trackColor = [UIColor whiteColor];
}

-(void)setProgess:(float)progess animated:(BOOL)animated{
    if (progess < 0.0f) {
        progess = 0.0f;
    }else if (progess > 1.0f){
        progess = 1.0f;
    }
    
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progess"];
        animation.duration = 0.25;
        animation.fromValue = @(layer.progess);//开始值
        animation.toValue = @(progess);//结束值
        [layer addAnimation:animation forKey:@"progressAnimation"];
        layer.progess = progess;
    }else{
        layer.progess = progess;
        [layer setNeedsDisplay];
    }
}

-(void)setProgess:(float)progess{
    BOOL growing = progess > self.progess;
    [self setProgess:progess animated:growing];
}

-(float)progess{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    return layer.progess;
}

-(void)setTrackColor:(UIColor *)trackColor{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.trackColor = trackColor;
}

-(UIColor *)trackColor {
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    return layer.trackColor;
}

-(void)setTintColor:(UIColor *)tintColor{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.tintColor = tintColor;
    [layer setNeedsDisplay];

}

-(UIColor *)tintColor{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    return layer.tintColor;
}

-(void)setStartAngle:(float)startAngle{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.startAngle = startAngle;
    [layer setNeedsDisplay];
}

@end
