//
//  ViewController.m
//  WCT核心动画
//
//  Created by four on 16/3/7.
//  Copyright © 2016年 four. All rights reserved.
//

#import "ViewController.h"
#import "MyCAHelper.h"

#import "FlipViewController.h"
#import "UIViewAnimationVC.h"

@interface ViewController ()
{
    UIView *_demoView;
    CGPoint location;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    _demoView = [[UIView alloc]initWithFrame:CGRectMake(80, 80, 30, 30)];
    [_demoView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_demoView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    location = [touch locationInView:self.view];
    
    if (self.type == 0) {
        //0.测试基本动画
        CABasicAnimation *anim = [self testBasic1];
        [anim setRepeatCount:3];
        
        [_demoView.layer addAnimation:anim forKey:nil];
    }else if (self.type == 1) {
        //1.测试弹力仿真动画效果
        [_demoView.layer addAnimation:[self test1:_demoView.center to:location] forKey:nil];
    }else if (self.type == 2) {
        //2.测试路径关键帧动画
        //(画圈，画S，画弧)
        [_demoView.layer addAnimation:[self test2] forKey:nil];
    }else if (self.type == 3) {
        [_demoView.layer addAnimation:[self test3:_demoView.center to:location] forKey:nil];
    }else if (self.type == 4) {
        [_demoView.layer addAnimation:[self test4:_demoView.center to:location] forKey:nil];
    }else if (self.type == 5) {
        //3.测试摇晃关键帧动画
        //点击屏幕，开始摇晃，再次点击，停止摇晃
        CAAnimation *anim = [_demoView.layer animationForKey:@"shakeAnimation"];
        if (anim) {
            [_demoView.layer removeAnimationForKey:@"shakeAnimation"];
        } else {
            [_demoView.layer addAnimation:[self test5] forKey:@"shakeAnimation"];
        }
    }
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    // 需要在这里对不同对象的动画方法进行完成处理！
    [_demoView setCenter:location];
    NSLog(@"%@", NSStringFromCGPoint(_demoView.center));
}

#pragma mark - 重构方法测试
#pragma mark 测试贝塞尔路径关键帧动画
- (CAKeyframeAnimation *)test5
{
    return [MyCAHelper myKeyShakeAnimationWithDuration:0.2 angle:M_PI_4 / 18 repeatCount:MAXFLOAT];
}

#pragma mark 测试贝塞尔路径关键帧动画
- (CAKeyframeAnimation *)test4:(CGPoint)from to:(CGPoint)to
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 有两个控制点去挤出的曲线，能挤出S型的曲线
    [path moveToPoint:from];
    [path addCurveToPoint:to controlPoint1:CGPointMake(320, 0) controlPoint2:CGPointMake(0, 460)];
    //    [path addCurveToPoint:CGPointMake(400,400) controlPoint1:CGPointMake(300, 0) controlPoint2:CGPointMake(0, 400)];
    
    return [MyCAHelper myKeyPathAnimationWithDuration:2.0 path:path];
}

#pragma mark 测试贝塞尔路径关键帧动画
- (CAKeyframeAnimation *)test3:(CGPoint)from to:(CGPoint)to
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 只有一个控制点去挤出的曲线
    [path moveToPoint:from];//一定要设置 不然底层的CGPathRef找不到起始点，将会崩溃
    [path addQuadCurveToPoint:to controlPoint:CGPointMake(320, 230)];
    
    return [MyCAHelper myKeyPathAnimationWithDuration:2.0 path:path];
}

#pragma mark 测试路径关键帧动画
- (CAKeyframeAnimation *)test2
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    
    return [MyCAHelper myKeyPathAnimationWithDuration:1.0 path:path];
}

#pragma mark 测试弹力仿真动画效果
- (CAKeyframeAnimation *)test1:(CGPoint)from to:(CGPoint)to
{
    CAKeyframeAnimation *anim = [MyCAHelper myKeyBounceAnimationFrom:from to:to duration:1.5];
    [anim setFillMode:kCAFillModeForwards];
    [anim setRemovedOnCompletion:NO];
    
    [anim setDelegate:self];
    
    return anim;
}

#pragma mark 颜色渐变仿真动画效果
- (CABasicAnimation *)testBasic1
{
    return [MyCAHelper myBasicAnimationWithType:@"opacity" duration:1.0 from:@(1.0) to:@(0.1) autoRevereses:YES];
}



//GCD的方式写单例
+(instancetype)shareInstance
{
    static ViewController *vc = nil;
    
    static dispatch_once_t onceToken;
    
    //使用这种方式，可以保证block里面的代码只会被执行一次。
    dispatch_once(&onceToken, ^{
        vc = [[ViewController alloc]init];
    });
    return vc;
}

@end
