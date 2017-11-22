//
//  PathLayer.m
//  WCT核心动画
//
//  Created by four on 2017/11/8.
//  Copyright © 2017年 four. All rights reserved.
//

#import "PathLayer.h"

//需要添加必要库
#import <UIKit/UIKit.h>

@implementation PathLayer

- (instancetype)initWithLayer:(id)layer{
    
    self = [super initWithLayer:layer];
    
    if (self) {
        
        /*
         这样做可以达到跟上面例子(UIView)一样的效果，那么为什么推荐使用这种方式呢？
         答案是：CALayer自带动画效果（或者说自带自动形成动画帧的天赋）
         
         １）直接在View中绘图可以形成动画效果，但前提是其变化幅度要求非常小，否则看起来就是一段一段的很生硬，比如上面的例子中，progress从0.2变化到0.5的时候，***并没有动画效果***。
         
         ２）对比起来在CALayer中绘图可以使用CA动画让其自定义的属性变化也有动画效果，其原理是：给Layer的属性提供初值、终值和动画时间，CA会自动计算中间值，并生产关键帧，在非主线程中播放关键帧，这样就形成了动画效果。

         
         
         总结
         　　至此，我们基本了解了自定义View动画的实现流程，大家可以根据不同情形选择其实现方式：
         
         　　1）变化幅度小，变化速度快的情景，选用setNeedsDisplay进行重绘就可以满足需求。
         　　应用场景：进度条的拖动、下拉刷新的动画、等等
         
         　　2）变化幅度大、变化速度慢的情景，选用给属性添加CA动画来满足需求。
         　　应用场景：下载进度的变化、数字变化的效果w
         */
    }
    
    return self;
}

/**
 不同于View的- (void)drawRect:(CGRect)rect{}

 @param ctx 图文上下文
 */
- (void)drawInContext:(CGContextRef)ctx{
    
    [self bezierPathAddAnimation:ctx];
}

- (void)bezierPathAddAnimation:(CGContextRef)ctx{
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0.0 endAngle:M_PI * 2 * self.progress clockwise:YES];
    
    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1);
    CGContextSetLineWidth(ctx, 2.0);
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    
}

//- (void)setProgress:(CGFloat)progress {
//    _progress = progress;
//    [self setNeedsDisplay];
//}

//系统方法
+ (BOOL)needsDisplayForKey:(NSString *)key{
    if([key isEqualToString:@"progress"]){
        return YES;
    }
    return [super needsDisplayForKey:key];
}

@end
