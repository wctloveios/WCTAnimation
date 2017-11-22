//
//  MyCAHelper.h
//  WCT核心动画
//
//  Created by four on 16/3/7.
//  Copyright © 2016年 four. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define kCAHelperAlphaAnimation @"opacity";                 // 淡入淡出动画
#define kCAHelperScaleAnimation @"transform.scale";         // 比例缩放动画
#define kCAHelperRotationAnimation @"transform.rotation";   // 旋转动画
#define kCAHelperPositionAnimation @"position";             // 平移位置动画

@interface MyCAHelper : NSObject

#pragma mark - 基本动画统一调用方法
+ (CABasicAnimation *)myBasicAnimationWithType:(NSString *)animationType
                                      duration:(CFTimeInterval)duration
                                          from:(NSValue *)from
                                            to:(NSValue *)to
                                 autoRevereses:(BOOL)autoRevereses;

#pragma mark - 关键帧动画方法
#pragma mark 摇晃动画
+ (CAKeyframeAnimation *)myKeyShakeAnimationWithDuration:(CFTimeInterval)duration
                                                   angle:(CGFloat)angle
                                             repeatCount:(CGFloat)repeatCount;

#pragma mark 贝塞尔路径动画
+ (CAKeyframeAnimation *)myKeyPathAnimationWithDuration:(CFTimeInterval)duration
                                                   path:(UIBezierPath *)path;

#pragma mark 弹力仿真动画
+ (CAKeyframeAnimation *)myKeyBounceAnimationFrom:(CGPoint)from
                                               to:(CGPoint)to
                                         duration:(CFTimeInterval)duration;

@end