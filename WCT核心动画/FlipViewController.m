//
//  FlipViewController.m
//  WCT核心动画
//
//  Created by four on 2017/11/2.
//  Copyright © 2017年 four. All rights reserved.
//

#import "FlipViewController.h"

@interface FlipViewController ()

@property (nonatomic,assign) BOOL isAnimation;

@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;
@property (nonatomic,strong) UIView *orangeView;

@end

@implementation FlipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"点击屏幕";
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(100, 320, 90, 100)];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    self.orangeView = [[UIView alloc] initWithFrame:CGRectMake(100, 520, 90, 100)];
    self.orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.orangeView];
}


/**
 移动(x,y两个方面的移动)
 */
- (void)moveBasicAnimation{
    /*
     //绝对坐标
     position.x                   x轴上平移
     position.y                   y轴上平移
 
     //相对坐标
     //这里平移不是主屏幕的坐标为基准，是以自身坐标为基准，所以起始点和终点都是在自身基础上计算的
     transform.translation.x      x轴上平移(反着来)
     transform.translation.y      y轴上平移(反着来)
     transform.translation.z      z轴上平移(反着来)
     transform.translation        整体（中心）平移(反着来)
    */
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    //这里起始点是以self.orangeView.layer的中心点（0，0）为起点，移动（50，50）的相对距离，讨论的是相对坐标
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0,0)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    anim.removedOnCompletion = NO;
    anim.duration = 5;
    anim.repeatCount = 0;
    anim.fillMode = kCAFillModeForwards;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.orangeView.layer addAnimation:anim forKey:@"transform.translation"];
}


/**
 旋转（x，y，z三个方面的旋转）
 */
- (void)rotatingBasicAnimation{
    /*
     transform.rotation.x       x轴旋转
     transform.rotation.y       y轴旋转
     transform.rotation.z       z轴旋转
     transform.rotation         旋轉（绕Z轴）
     */
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    // 缩放倍数
    anim.fromValue = @(0); // 开始时的角度
    anim.toValue = @(M_PI); // 结束时的角度
    anim.removedOnCompletion = NO;
    anim.duration = 3;
    anim.fillMode = kCAFillModeBackwards;
    anim.repeatCount = MAXFLOAT;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.orangeView.layer addAnimation:anim forKey:@"transform.rotation.x"];
}


/**
 缩放(x,y,z三个方面的缩放)
 */
- (void)scaleBasicAnimation{
    /*
     transform.scale        整体缩放（中心不变）
     transform.scale.x      x轴上缩放
     transform.scale.y      y轴上缩放
     transform.scale.z      z轴上缩放（垂直于屏幕的轴）
     */
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 缩放倍数
    anim.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    anim.toValue = [NSNumber numberWithFloat:0.5]; // 结束时的倍率
    anim.removedOnCompletion = NO;
    anim.duration = 3;
    anim.fillMode = kCAFillModeBackwards;
    anim.repeatCount = MAXFLOAT;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.orangeView.layer addAnimation:anim forKey:@"transform.scale"];
    
}


/**
 基本动画组合
 */
- (void)basicGroupBasicAnimation{
    
    //4、组合动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    anim.toValue = [NSNumber numberWithFloat:0.5]; // 结束时的倍率
    anim.removedOnCompletion = NO;
    anim.duration = 3;
    anim.fillMode = kCAFillModeForwards;
    anim.repeatCount = 0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.orangeView.layer addAnimation:anim forKey:@"transform.scale"];
    
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"position"];
    anim1.fromValue = [NSValue valueWithCGPoint:self.orangeView.center];
    anim1.toValue = [NSValue valueWithCGPoint:self.redView.center]; // 结束时的倍率
    anim1.removedOnCompletion = NO;
    anim1.duration = 3;
    anim1.fillMode = kCAFillModeForwards;
    anim1.repeatCount = 0;
    anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.orangeView.layer addAnimation:anim1 forKey:@"position"];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    anim2.fromValue = @(0);
    anim2.toValue = @(M_PI);
    anim2.removedOnCompletion = NO;
    anim2.duration = 3;
    anim2.fillMode = kCAFillModeForwards;
    anim2.repeatCount = 0;
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.orangeView.layer addAnimation:anim2 forKey:@"transform.rotation.x"];
}


/**
 阴影
 */
- (void)shadowBasicAnimation{
    /*
     shadowColor            颜色
     shadowOffset           size
     shadowOpacity          不透明度
     shadowRadius           圆角
     */
    
    //可以事先设置keyPath，也可以通过动画设置,但是单纯数值只能提前设置（暂时找不到哪里设置--!）
//    self.redView.layer.shadowOffset = CGSizeMake(10, -30);
//    self.redView.layer.shadowColor = [UIColor blueColor].CGColor;
    self.redView.layer.shadowOpacity = 0.2;
    self.redView.layer.shadowRadius = 5;

    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    anim.fromValue = [NSValue valueWithCGSize:CGSizeMake(10, 30)];
    anim.toValue = [NSValue valueWithCGSize:CGSizeMake(-10, -30)];
    anim.removedOnCompletion = NO;
    anim.duration = 5;
    anim.fillMode = kCAFillModeBackwards;
    anim.repeatCount = MAXFLOAT;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim forKey:@"shadowOffset"];
    
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    anim1.fromValue = (id)[UIColor redColor].CGColor;
    anim1.toValue = (id)[UIColor blueColor].CGColor;
    anim1.removedOnCompletion = NO;
    anim1.duration = 5;
    anim1.fillMode = kCAFillModeBackwards;
    anim1.repeatCount = MAXFLOAT;
    anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim1 forKey:@"shadowColor"];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    anim2.removedOnCompletion = NO;
    anim2.duration = 5;
    anim2.fillMode = kCAFillModeBackwards;
    anim2.repeatCount = MAXFLOAT;
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim2 forKey:@"shadowOpacity"];
    
    CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    anim3.removedOnCompletion = NO;
    anim3.duration = 5;
    anim3.fillMode = kCAFillModeBackwards;
    anim3.repeatCount = MAXFLOAT;
    anim3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim3 forKey:@"shadowRadius"];
    
}



/**
 不透明度、背景颜色、圆角、边框线宽度、内容
 */
- (void)opacityBasicAnimation{
    
    /*
     opacity                    不透明度
     backgroundColor            背景颜色
     cornerRadius               圆角
     borderWidth                边框线宽度
     borderColor                边框线颜色
     contents                   内容
     */
    
    //可以事先设置keyPath，也可以通过动画设置,但是单纯数值只能提前设置（暂时找不到哪里设置--!）
    self.redView.layer.cornerRadius = 30;
    self.redView.layer.borderWidth = 10;
//    self.redView.layer.borderColor = [UIColor greenColor].CGColor;
    self.redView.layer.opacity = 0.5;
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim.fromValue = (id)[UIColor redColor].CGColor;
    anim.toValue = (id)[UIColor blueColor].CGColor;
    anim.removedOnCompletion = NO;
    anim.duration = 5;
    anim.fillMode = kCAFillModeBackwards;
    anim.repeatCount = MAXFLOAT;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim forKey:@"backgroundColor"];
    
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anim1.removedOnCompletion = NO;
    anim1.duration = 5;
    anim1.fillMode = kCAFillModeBackwards;
    anim1.repeatCount = MAXFLOAT;
    anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim1 forKey:@"cornerRadius"];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    anim2.removedOnCompletion = NO;
    anim2.duration = 5;
    anim2.fillMode = kCAFillModeBackwards;
    anim2.repeatCount = MAXFLOAT;
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim2 forKey:@"borderWidth"];
    
    CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    anim3.fromValue = (id)[UIColor redColor].CGColor;
    anim3.toValue = (id)[UIColor greenColor].CGColor;
    anim3.removedOnCompletion = NO;
    anim3.duration = 5;
    anim3.fillMode = kCAFillModeBackwards;
    anim3.repeatCount = MAXFLOAT;
    anim3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.redView.layer addAnimation:anim3 forKey:@"borderColor"];
    
}



- (void)moveKeyFrameAnimation{
    
    //设定关键帧位置，必须含起始与终止位置
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rectRunAnimation.values = @[[NSValue valueWithCGPoint:self.orangeView.frame.origin],
                                [NSValue valueWithCGPoint:CGPointMake(320,self.orangeView.frame.origin.y)],
                                [NSValue valueWithCGPoint:CGPointMake(320,self.orangeView.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:CGPointMake(self.orangeView.frame.origin.x,self.orangeView.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:self.orangeView.frame.origin]];
    
    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:0.5],
                                  [NSNumber numberWithFloat:0.7],
                                  [NSNumber numberWithFloat:1]];
    
    rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    rectRunAnimation.repeatCount = MAXFLOAT;
    rectRunAnimation.autoreverses = NO;
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration = 4;
    [self.orangeView.layer addAnimation:rectRunAnimation forKey:@"position"];
    

    //绕弧移动
    CAKeyframeAnimation * ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(130, 200, 100, 100));
    ani.path = path;
    CGPathRelease(path);
    
    ani.duration = 4.0;
    ani.repeatCount = MAXFLOAT;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    [self.blueView.layer addAnimation:ani forKey:@"position"];
    
}


-(void)transitionAnimation{
    // 基本的转场动画类型
    NSArray *typeArr = @[@"fade",@"push",@"moveIn",@"reveal",@"cube",@"oglFlip",@"suckEffect",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"];
    
    /** 转场动画代码 */
    static int index = 2;
    self.redView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5];
    index++;
    
    if (index == 12) {
        index = 1;
    }
    
    // 创建转场动画对象
    CATransition *anim = [CATransition animation];
    // 设置转场类型
    anim.type = typeArr[index];
    // 过渡动画的方向
    anim.subtype = kCATransitionFromLeft;
    anim.duration = 3;
    //转场结果设置
    [self.redView.layer addAnimation:anim forKey:@"transitionAni"];
}


- (void)springAnimation{
    
    /*CASpringAnimation的重要属性：
     　mass：质量（影响弹簧的惯性，质量越大，弹簧惯性越大，运动的幅度越大）
     　stiffness：弹性系数（弹性系数越大，弹簧的运动越快）
     　damping：阻尼系数（阻尼系数越大，弹簧的停止越快）
     　initialVelocity：初始速率（弹簧动画的初始速度大小，弹簧运动的初始方向与初始速率的正负一致，若初始速率为0，表示忽略该属性）
     　settlingDuration：结算时间（根据动画参数估算弹簧开始运动到停止的时间，动画设置的时间最好根据此时间来设置）
    */
    
    /*
     CASpringAnimation和UIView的SpringAnimation对比：
     
     1.CASpringAnimation 可以设置更多影响弹簧动画效果的属性，可以实现更复杂的弹簧动画效果，且可以和其他动画组合。
     2.UIView的SpringAnimation实际上就是通过CASpringAnimation来实现。

     */
    
    CASpringAnimation * ani = [CASpringAnimation animationWithKeyPath:@"bounds"];
    ani.mass = 10.0;
    ani.stiffness = 5000;
    ani.damping = 100.0;
    ani.initialVelocity = 5.f;
    ani.duration = 2;
    ani.toValue = [NSValue valueWithCGRect:self.redView.bounds];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.blueView.layer addAnimation:ani forKey:@"bounds"];
}

- (void)groupAnimation{
    
    CABasicAnimation * posAni = [CABasicAnimation animationWithKeyPath:@"position"];
    posAni.toValue = [NSValue valueWithCGPoint:self.redView.center];
    
    CABasicAnimation * opcAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opcAni.fromValue = [NSNumber numberWithFloat:1.0];
    opcAni.toValue = [NSNumber numberWithFloat:0.5];
    
    CABasicAnimation * bodAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
    bodAni.toValue = [NSValue valueWithCGRect:self.redView.bounds];
    
    //将基础动画添加到组里面，不用重复添加基本属性
    CAAnimationGroup * groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[posAni, opcAni, bodAni];
    groupAni.duration = 1.0;
    groupAni.fillMode = kCAFillModeForwards;
    groupAni.removedOnCompletion = NO;
    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.blueView.layer addAnimation:groupAni forKey:@"group"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    

    //动画基本属性
    /*
     duration：动画的持续时间
     repeatCount：动画的重复次数
     timingFunction：动画的时间节奏控制
     fillMode：视图在非Active时的行为
     removedOnCompletion：动画执行完毕后是否从图层上移除，默认为YES（视图会恢复到动画前的状态），可设置为NO（图层保持动画执行后的状态，前提是fillMode设置为kCAFillModeForwards）
     beginTime：动画延迟执行时间（通过CACurrentMediaTime() + your time 设置）
     delegate：代理
     */
    
    if (self.type == 0) {
        [self moveBasicAnimation];//基本移动
    }else if (self.type == 1) {
        [self rotatingBasicAnimation];//旋转
    }else if (self.type == 2) {
        [self scaleBasicAnimation];//缩放
    }else if (self.type == 3) {
        [self basicGroupBasicAnimation];//组合动画
    }else if (self.type == 4) {
        [self shadowBasicAnimation];//阴影
    }else if (self.type == 5) {
        [self opacityBasicAnimation];//透明度
    }else if (self.type == 6) {
        [self moveKeyFrameAnimation];//关键帧动画
    }else if (self.type == 7) {
        [self transitionAnimation];//转场动画
    }else if (self.type == 8) {
        [self springAnimation];//弹簧动画
    }else if (self.type == 9) {
        [self groupAnimation];//组合动画
    }
    
    //========CABasicAnimation核心动画=======
//    [self moveBasicAnimation];//基本移动

//    [self rotatingBasicAnimation];//旋转

//    [self scaleBasicAnimation];//缩放

//    [self basicGroupBasicAnimation];//组合动画
    
//    [self shadowBasicAnimation];/阴影
    
//    [self opacityBasicAnimation];//透明度
    
    
    //========CAKeyFrameAnimation关键帧动画=====
//    [self moveKeyFrameAnimation];//关键帧动画
    
    
    //========CATransition转场动画=============
//    [self transitionAnimation];//转场动画
    
    //========CASpringAnimation弹簧动画========
//    [self springAnimation];//弹簧动画
    
    //========CAAnimationGroup组合动画========
//    [self groupAnimation];//组合动画
    
    //========CATransaction事务，==============
    /*
     一、最后讲一下事务，在核心动画里面存在事务（CATransaction）这样一个概念，它负责协调多个动画原子更新显示操作。
     简单来说事务是核心动画里面的一个基本的单元，动画的产生必然伴随着layer的Animatable属性的变化，而layer属性的变化必须属于某一个事务。
     因此，核心动画依赖事务。
     
     
     二、事务的作用：保证一个或多个layer的一个或多个属性变化同时进行
     　　事务分为隐式和显式：
     　　1.隐式：没有明显调用事务的方法，由系统自动生成事务。比如直接设置一个layer的position属性，则会在当前线程自动生成一个事务，并在下一个runLoop中自动commit事务。
     　　2.显式：明显调用事务的方法（[CATransaction begin]和[CATransaction commit]）。
         CA事务的可设置属性（会覆盖隐式动画的设置）：
         ===========
         animationDuration：动画时间
         animationTimingFunction：动画时间曲线
         disableActions：是否关闭动画
         completionBlock：动画执行完毕的回调
         ===========
     
     三、事务支持嵌套使用：当最外层的事务commit后动画才会开始。
     [CATransaction begin];
     [CATransaction setAnimationDuration:2.0];
     [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
     //    [CATransaction setDisableActions:YES]; //设置为YES就关闭动画
     self.subLayer.bounds = self.centerShow.layer.bounds;
     [CATransaction commit];
     
     注意：只有非root layer才有隐式动画，如果你是直接设置self.cartCenter.layer.bounds = self.centerShow.layer.bounds;是不会有动画效果的。
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
