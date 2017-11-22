//
//  ShapeView.m
//  WCT核心动画
//
//  Created by four on 2017/11/9.
//  Copyright © 2017年 four. All rights reserved.
//

#import "ShapeView.h"

const CGFloat LayerRadius = 50.0;

//定义屏幕的宽和高
#define MainScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define MainScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define topPointColor    [UIColor colorWithRed:90 / 255.0 green:200 / 255.0 blue:200 / 255.0 alpha:1.0].CGColor
#define leftPointColor   [UIColor colorWithRed:250 / 255.0 green:85 / 255.0 blue:78 / 255.0 alpha:1.0].CGColor
#define bottomPointColor [UIColor colorWithRed:92 / 255.0 green:201 / 255.0 blue:105 / 255.0 alpha:1.0].CGColor
#define rightPointColor  [UIColor colorWithRed:253 / 255.0 green:175 / 255.0 blue:75 / 255.0 alpha:1.0].CGColor

@interface ShapeView ()

//四个圆
@property (nonatomic, strong) CAShapeLayer * TopPointLayer;
@property (nonatomic, strong) CAShapeLayer * BottomPointLayer;
@property (nonatomic, strong) CAShapeLayer * LeftPointLayer;
@property (nonatomic, strong) CAShapeLayer * rightPointLayer;
@end

@implementation ShapeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLayers];
    }
    return self;
}

- (void)initLayers{
    
    //上圆
    CGPoint topPoint = CGPointMake(200, 250 - 80);
    self.TopPointLayer = [self layerWithPoint:topPoint color:topPointColor];
    self.TopPointLayer.hidden = NO;
    self.TopPointLayer.opacity = 1.0;
    [self.layer addSublayer:self.TopPointLayer];
    
    //左圆
    CGPoint leftPoint = CGPointMake(200 - 80, 250);
    self.LeftPointLayer = [self layerWithPoint:leftPoint color:leftPointColor];
    [self.layer addSublayer:self.LeftPointLayer];
    
    //下圆
    CGPoint bottomPoint = CGPointMake(200, 250 + 80);
    self.BottomPointLayer = [self layerWithPoint:bottomPoint color:bottomPointColor];
    [self.layer addSublayer:self.BottomPointLayer];
    
    //右圆
    CGPoint rightPoint = CGPointMake(200 + 80, 250);
    self.rightPointLayer = [self layerWithPoint:rightPoint color:rightPointColor];
    [self.layer addSublayer:self.rightPointLayer];
}


/**
 旋转动画
 */
- (void)startAnimation{
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 250) radius:80 startAngle:M_PI_2*3 endAngle:M_PI * 2 + M_PI_2*3 clockwise:YES];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.duration = 5;
    animation.repeatCount = MAXFLOAT;
    animation.rotationMode = kCAAnimationRotateAuto;
    [self.TopPointLayer addAnimation:animation forKey:@"position"];
    
    CAKeyframeAnimation *animation5 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation5.values = @[@(1.0),@(0.6),@(0.2),@(0.6),@(1.0)];
    animation5.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation5.duration = 5;
    animation5.repeatCount = MAXFLOAT;
    animation5.rotationMode = kCAAnimationRotateAuto;
    [self.TopPointLayer addAnimation:animation5 forKey:@"transform.scale"];

    

    UIBezierPath * path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 250) radius:80 startAngle:M_PI_2*2 endAngle:M_PI * 2+M_PI_2*2  clockwise:YES];
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation1.path = path1.CGPath;
    animation1.duration = 5;
    animation1.repeatCount = MAXFLOAT;
    animation1.rotationMode = kCAAnimationRotateAuto;
    [self.LeftPointLayer addAnimation:animation1 forKey:@"position"];
    
    
    CAKeyframeAnimation *animation6 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation6.values = @[@(1.0),@(0.6),@(0.2),@(0.6),@(1.0)];
    animation6.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation6.duration = 5;
    animation6.repeatCount = MAXFLOAT;
    animation6.rotationMode = kCAAnimationRotateAuto;
    [self.LeftPointLayer addAnimation:animation6 forKey:@"transform.scale"];
    
    UIBezierPath * path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 250) radius:80 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation2.path = path2.CGPath;
    animation2.duration = 5;
    animation2.repeatCount = MAXFLOAT;
    animation2.rotationMode = kCAAnimationRotateAuto;
    [self.rightPointLayer addAnimation:animation2 forKey:@"position"];
    
    CAKeyframeAnimation *animation7 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation7.values = @[@(1.0),@(0.6),@(0.2),@(0.6),@(1.0)];
    animation7.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation7.duration = 5;
    animation7.repeatCount = MAXFLOAT;
    animation7.rotationMode = kCAAnimationRotateAuto;
    [self.rightPointLayer addAnimation:animation7 forKey:@"transform.scale"];
    
    UIBezierPath * path3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 250) radius:80 startAngle:M_PI_2 endAngle:M_PI * 2+M_PI_2 clockwise:YES];
    CAKeyframeAnimation *animation3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation3.path = path3.CGPath;
    animation3.duration = 5;
    animation3.repeatCount = MAXFLOAT;
    animation3.rotationMode = kCAAnimationRotateAuto;
    [self.BottomPointLayer addAnimation:animation3 forKey:@"position"];
    
    CAKeyframeAnimation *animation8 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation8.values = @[@(1.0),@(0.6),@(0.2),@(0.6),@(1.0)];
    animation8.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation8.duration = 5;
    animation8.repeatCount = MAXFLOAT;
    animation8.rotationMode = kCAAnimationRotateAuto;
    [self.BottomPointLayer addAnimation:animation8 forKey:@"transform.scale"];
}


- (CAShapeLayer *)layerWithPoint:(CGPoint)center color:(CGColorRef)color{
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(center.x - LayerRadius, center.y - LayerRadius, LayerRadius * 2, LayerRadius * 2);
    layer.fillColor = color;
    layer.path = [self pointPath];
//    layer.hidden = YES;
    return layer;
}

- (CGPathRef)pointPath{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(LayerRadius, LayerRadius) radius:LayerRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    return path.CGPath;
}

@end
