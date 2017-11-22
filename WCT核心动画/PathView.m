//
//  PathView.m
//  WCT核心动画
//
//  Created by four on 2017/11/7.
//  Copyright © 2017年 four. All rights reserved.
//

#import "PathView.h"

@interface PathView ()<CAAnimationDelegate>

@end

@implementation PathView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        //添加CALyer上的动画
        [self.layer addSublayer:self.pathLayer];

        /*
         三、路径
         　　相信很多人都临摹过书法，在一张薄薄的纸上照着书法家的笔迹来书写，这个“笔迹”就可以看成路径，通过确定的路径，可以确定绘图的形状、渲染的区域等等。
         　　通过创建路径并加入到上下文中渲染就能绘制出想要的图形。
         创建路径有以下三种方式：
         
         1.使用CGContextRef创建，如CGContextAddArc，
         这种方式是直接对图形上下文进行操作，
         常用的方法有：
         CGContextBeginPath //开始画路径
         CGContextMoveToPoint //移动到某一点
         CGContexAddLineToPoint //画直线
         CGContexAddCurveToPoint //画贝塞尔曲线（两个点）
         CGContextAddQuadCurveToPoint//画曲线（一个点）
         CGContexAddEllipseInRect //画椭圆
         CGContexAddArc //画圆
         CGContexAddRect //画方框
         CGContexClosePath //封闭当前路径
         
         
         2.使用CGPathRef创建，如CGPathAddArc，
         使用方法一绘制路径后将清空图形上下文，如果我们想保存路径来复用，可以使用Quartz提供的CGPath函数集合来创建可复用的路径对象。
         常用的函数如下：
         CGPathCreateMutable
         CGPathMoveToPoint
         CGPathAddLineToPoint
         CGPathAddCurveToPoint
         CGPathAddEllipseInRect
         CGPathAddArc
         CGPathAddRect
         CGPathCloseSubpath
         前面这些函数和上面方法1中的方法一一对应，可代替之使用。
         CGContextAddPath：添加一个新的路径
         
         
         *3.使用UIBezierPath创建，如bezierPathWithOvalInRect
         UIBezierPath存在于UIKit中，是对路径绘制的封装，和CGContextRef类似，优点是更面向对象，我们可以像操作普通对象一样对其进行操作。
         　  在自定义View的时候，一般使用UIBezierPath来创建路径就能基本满足我们的需求，====推荐使用====。
         UIBezierPath的常用方法如下：
         @property(nonatomic) CGFloat lineWidth; //线的宽度
         @property(nonatomic) CGLineCap lineCapStyle; //起点和终点样式
         @property(nonatomic) CGLineJoin lineJoinStyle; //转角样式
         //创建path
         + (instancetype)bezierPath;
         //矩形
         + (instancetype)bezierPathWithRect:(CGRect)rect;
         //以矩形框为切线画圆
         + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
         //带圆角的矩形框
         + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
         //画圆弧
         + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
         //移动到某一点
         - (void)moveToPoint:(CGPoint)point;
         //添加直线
         - (void)addLineToPoint:(CGPoint)point;
         //带一个基准点的曲线
         - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
         //带两个基准点的曲线
         - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
         //封闭路径
         - (void)closePath;
         //添加新的路径
         - (void)appendPath:(UIBezierPath *)bezierPath;
         //渲染
         - (void)fill;
         - (void)stroke;
         
         
         4、渲染
         绘画的最后一步，它之于绘图的意义如画画的最后上颜料一样。
         
         　　 渲染分为两种方式：
         　　 １）填充Fill：将路径内部填充渲染
         　　 ２）描边Stroke：不填充，只对路径进行渲染
         
         5、绘图状态栈
         
         　　 图形上下文包含一个绘图状态栈，默认为空。
         　　 １）保存图形状态时，将创建当前图形状态的一个副本并入栈。
         　   ２）还原图形状态时，将栈顶的图形状态推出栈并替换当前图形状态。
         　　 使用：调用CGContextSaveGState来保存，CGContextRestoreGState来还原。
         */
    }
    return self;
}


- (void)drawRect:(CGRect)rect{
    
//    [self contextRef];
    
//    [self PathRef];
    
//    [self bezierPath];
    
    [self bezierPathAddAnimation];
}


/**
 使用CGContextRef创建路径
 */
- (void)contextRef{
    //先获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    //==========规则图形==============
    //圆
    CGContextAddArc(ctx, 200, 200, 100, 0, M_PI*2, 0);
    //直线
    CGContextMoveToPoint(ctx, 0, 300);
    CGContextAddLineToPoint(ctx, 400, 300);
    //矩形
    CGContextAddRect(ctx, CGRectMake(160, 160, 80, 80));
    //椭圆
    CGContextAddEllipseInRect(ctx, CGRectMake(175, 175, 50, 50));
    
    
    //===========不规则图形============
    //1、普通曲线（一个点，设置两条也是两个点，但是两个点之间不影响）
//    //设置Path的起点
//    CGContextMoveToPoint(ctx, 100, 400);
//    //设置曲线的控制点坐标（150, 300）和终点坐标（200，200）
//    CGContextAddQuadCurveToPoint(ctx, 150, 300, 200, 400);
//    //设置曲线的控制点坐标（250, 500）和终点坐标（200，200）
//    CGContextAddQuadCurveToPoint(ctx, 250, 500, 300, 400);

    
    //2、贝塞尔曲线（两个点，两个点之间会影响）
    //设置Path的起点，只会向下影响
    CGContextMoveToPoint(ctx, 100, 100);
    //设置贝塞尔曲线的两个控制点坐标（100，300）（200，100）和终点坐标（200，200）
    CGContextAddCurveToPoint(ctx, 100, 300, 200, 100, 200, 200);
    CGContextAddCurveToPoint(ctx, 200, 400, 400, 100, 400, 400);
    
    
    //修改图形状态参数
    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1);
    CGContextSetLineWidth(ctx, 1);
    
    //最后渲染
    CGContextStrokePath(ctx);
}

/**
 使用CGPathRef创建路径
 */
- (void)PathRef{
    
    //获取上下文
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    
    //创建可变路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //添加圆形到路径中(所在路径、不进行变换操作、中心坐标(x,y),半径、起点弧度0、终点弧度2PI、画的方向0逆1正)
    CGPathAddArc(path, NULL, 200, 200, 100, 0, M_PI*2, 0);
    
    //将路径添加到上下文
    CGContextAddPath(ctx, path);
    
    //设置基本参数
    CGContextSetLineWidth(ctx, 2);
    CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0.0, 1);
    
    //渲染
    CGContextStrokePath(ctx);
}

/**
 使用UIBezierPath创建
 */
- (void)bezierPath{
    
    //类似对象一样创建
    //创建路径
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    
    //修改图形状态参数
    [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0] setStroke];
    
    [path setLineWidth:10];//线条宽度
    //渲染
    [path stroke];
    
}


- (void)bezierPathAddAnimation{
    
//   弧度总不能写死吧，弧度得有变化才能形成动画效果。怎样控制它变化呢，我们给它加上一个progress属性来控制其弧度
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0.0 endAngle:M_PI * 2 * self.progress clockwise:YES];
    [[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] setStroke];
    [path setLineWidth:3.0];
    
    [path stroke];
    
}

- (void)setProgress:(CGFloat)progress{
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"progress"];
    ani.duration = 5.0 * fabs(progress - _progress);
    ani.toValue = @(progress);
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.delegate = self;
    [self.pathLayer addAnimation:ani forKey:@"progress"];
    _progress = progress;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.pathLayer.progress = self.progress;
}

//添加CALyer上的动画
- (PathLayer *)pathLayer{
    
    if (!_pathLayer) {
        _pathLayer = [PathLayer layer];
        _pathLayer.frame = self.bounds;
        _pathLayer.contentsScale = [UIScreen mainScreen].scale;
    }
    return _pathLayer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
