//
//  ProgressView.h
//  progressBtn
//
//  Created by 黄家树 on 2017/12/2.
//  Copyright © 2017年 黄家树. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressLayer.h"

@interface ProgressView : UIView
@property(nonatomic,assign) float progess;
@property(nonatomic,assign) float startAngle;
@property(nonatomic,strong) UIColor *tintColor;
@property(nonatomic,strong) UIColor *trackColor;

-(void)setProgess:(float)progess animated:(BOOL)animated;
@end
