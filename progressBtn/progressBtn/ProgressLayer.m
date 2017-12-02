//
//  ProgressLayer.m
//  progressBtn
//
//  Created by 黄家树 on 2017/12/2.
//  Copyright © 2017年 黄家树. All rights reserved.
//

#import "ProgressLayer.h"

@implementation ProgressLayer

-(instancetype)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        if ([layer isKindOfClass:[ProgressLayer class]]) {
            ProgressLayer *otherLayer = layer;
            _progess    = otherLayer.progess;
            _startAngle = otherLayer.startAngle;
            _tintColor  = otherLayer.tintColor;
            _trackColor = otherLayer.trackColor;
        }
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"progess"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}


-(void)drawInContext:(CGContextRef)ctx{
    CGSize size = self.bounds.size;
    CGFloat radius = MIN(size.width, size.height)/2.0;
    CGPoint center = {size.width/2.0,size.height/2.0};
    
    // 绘制背景圆
    CGRect circleRect = {center.x - radius,center.y - radius,radius * 2.0, radius * 2.0};
    CGContextAddEllipseInRect(ctx, circleRect);
    
    //填充颜色绘制路径
    CGContextSetFillColorWithColor(ctx, _trackColor.CGColor);
    CGContextFillPath(ctx);
    
    //对经弧线的绘制
    CGContextAddArc(ctx, center.x, center.y, radius, _startAngle, _startAngle + _progess * 2 * M_PI, 0);//添加弧线
    CGContextAddLineToPoint(ctx, center.x, center.y);//添加弧线到圆心的连线
    CGContextClosePath(ctx);//闭合图形
    
    CGContextSetFillColorWithColor(ctx, _tintColor.CGColor);
    CGContextFillPath(ctx);
}

@end
