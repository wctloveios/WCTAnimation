//
//  MyCAHelper.m
//  WCT核心动画
//
//  Created by four on 16/3/7.
//  Copyright © 2016年 four. All rights reserved.
//

#import "MyCAHelper.h"

@implementation MyCAHelper

#pragma mark - 基本动画统一调用方法
+ (CABasicAnimation *)myBasicAnimationWithType:(NSString *)animationType
                                      duration:(CFTimeInterval)duration
                                          from:(NSValue *)from
                                            to:(NSValue *)to
                                 autoRevereses:(BOOL)autoRevereses
{
    // 1. 实例化一个CA动画对象
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:animationType];
    
    // 2. 设置动画属性
    [anim setDuration:duration];
    
    [anim setFromValue:from];
    [anim setToValue:to];
    
    [anim setAutoreverses:autoRevereses];
    
    return anim;
}

#pragma mark - 关键帧动画方法
#pragma mark 摇晃动画
+ (CAKeyframeAnimation *)myKeyShakeAnimationWithDuration:(CFTimeInterval)duration
                                                   angle:(CGFloat)angle
                                             repeatCount:(CGFloat)repeatCount
{
    // 1. 初始化动画对象实例
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    // 2. 设置动画属性
    [anim setDuration:duration];
    
    [anim setValues:@[@(angle*2), @(-angle*2), @(angle*2)]];
    
    [anim setRepeatCount:repeatCount];
    
    //编译运行后可以发现demoView像一个钟摆一样不停摇晃，如果想效果更逼真，可以使用连续动画配合timingFunction来实现。
    return anim;
}

#pragma mark 贝塞尔路径动画
+ (CAKeyframeAnimation *)myKeyPathAnimationWithDuration:(CFTimeInterval)duration
                                                   path:(UIBezierPath *)path
{
    // 1. 初始化动画对象实例
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 2. 设置动画属性
    [anim setDuration:duration];
    
    [anim setPath:path.CGPath];
    
    //编译运行，会发现动画在执行后demoView回到了起点，这里需要对动画的两个属性进行设置，让图层在完成动画后停留在动画后的状态。
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    return anim;
}

#pragma mark 弹力仿真动画
+ (CAKeyframeAnimation *)myKeyBounceAnimationFrom:(CGPoint)from
                                               to:(CGPoint)to
                                         duration:(CFTimeInterval)duration
{
    // 是一个基于路径的动画
    // 首先定义一个路径，记录弹力仿真的整个路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 弹力仿真路径创建代码
    // 计算起始点与目标点之间的位置偏移量，这个偏移量的目的是为了能够计算出小球第一次延伸的长度
    CGFloat offsetX = from.x - to.x;
    CGFloat offsetY = from.y - to.y;
    
    // 1. 移动到起始点
    CGPathMoveToPoint(path, NULL, from.x, from.y);
    // 2. 将目标点的坐标添加到路径之中
    CGPathAddLineToPoint(path, NULL, to.x, to.y);
    // 3. 设置小球的弹力因子
    CGFloat offsetDivider = 3.0f;
    
    while (YES) {
        // 加延伸方向的路径
        CGPathAddLineToPoint(path, NULL, to.x + offsetX / offsetDivider,
                             to.y + offsetY / offsetDivider);
        
        // 再次将目标点添加到路径
        CGPathAddLineToPoint(path, NULL, to.x, to.y);
        
        // 弹力因子递增，保证越来越接近目标点
        offsetDivider += 5.0f;
        
        // 当小球的当前位置距离目标点足够小，我们退出循环
        if ((fabs(offsetX / offsetDivider) < 10.0f)
            && (fabs(offsetY / offsetDivider) < 10.0f)) {
            
            break;
        }
    }
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [anim setPath:path];
    
    // 释放路径
    CGPathRelease(path);
    
    [anim setDuration:duration];
    
    return anim;
}

@end

