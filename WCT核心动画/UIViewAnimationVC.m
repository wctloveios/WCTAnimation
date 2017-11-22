//
//  UIViewAnimationVC.m
//  动画集锦
//
//  Created by four on 2017/9/1.
//  Copyright © 2017年 four. All rights reserved.
//

#import "UIViewAnimationVC.h"

@interface UIViewAnimationVC ()

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong) UIView *TocontentView;

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation UIViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.contentView];
    
//    [self.view addSubview:self.TocontentView];
    
    /*
     UIView属性动画的Block，提供了动画执行时间duration,动画延时执行时间delay，动画执行Block代码块，已经动画完成回调block块completion。可以执行动画的属性有以下几种，
     ---大小变化(frame)可改变中心点
     ---拉伸变化(bounds)不改变中心点
     ---中心位置(center)
     ---旋转(transform)
     ---透明度(alpha)
     ---背景颜色(backgroundColor)
     ---内容拉伸(contentStretch)好像弃用了
     */
    
    

     
     /*
     简单动画过渡效果：
     UIViewAnimationOptionLayoutSubviews//进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction//进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState//从当前状态开始动画
     UIViewAnimationOptionRepeat//无限重复执行动画
     UIViewAnimationOptionAutoreverse//执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration//忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedCurve//忽略嵌套动画的曲线设置
     UIViewAnimationOptionAllowAnimatedContent//转场：进行动画时重绘视图
     UIViewAnimationOptionShowHideTransitionViews//转场：移除（添加和移除图层的）动画效果
     UIViewAnimationOptionOverrideInheritedOptions//不继承父动画设置
     UIViewAnimationOptionCurveEaseInOut//时间曲线，慢进慢出（默认值）
     UIViewAnimationOptionCurveEaseIn//时间曲线，慢进
     UIViewAnimationOptionCurveEaseOut//时间曲线，慢出
     UIViewAnimationOptionCurveLinear//时间曲线，匀速
     UIViewAnimationOptionTransitionNone//转场，不使用动画
     UIViewAnimationOptionTransitionFlipFromLeft//转场，从左向右旋转翻页
     UIViewAnimationOptionTransitionFlipFromRight//转场，从右向左旋转翻页
     UIViewAnimationOptionTransitionCurlUp//转场，下往上卷曲翻页
      UIViewAnimationOptionTransitionCurlDown//转场，从上往下卷曲翻页
      UIViewAnimationOptionTransitionCrossDissolve//转场，交叉消失和出现
      UIViewAnimationOptionTransitionFlipFromTop//转场，从上向下旋转翻页
      UIViewAnimationOptionTransitionFlipFromBottom//转场，从下向上旋转翻页
      */
    
    
    
    /*关键帧动画过渡效果
     UIViewAnimationOptionLayoutSubviews           //进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction     //进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState    //从当前状态开始动画
     UIViewAnimationOptionRepeat                   //无限重复执行动画
     UIViewAnimationOptionAutoreverse              //执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedOptions //不继承父动画设置
     
     UIViewKeyframeAnimationOptionCalculationModeLinear     //运算模式 :连续
     UIViewKeyframeAnimationOptionCalculationModeDiscrete   //运算模式 :离散
     UIViewKeyframeAnimationOptionCalculationModePaced      //运算模式 :均匀执行
     UIViewKeyframeAnimationOptionCalculationModeCubic      //运算模式 :平滑
     UIViewKeyframeAnimationOptionCalculationModeCubicPaced //运算模式 :平滑均匀
     */
    
    
    /*
     1、transform缩放
     CGAffineTransform 提供了两个方法用于缩放，分别是：
     CGAffineTransform CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
     CGAffineTransform CGAffineTransformScale(CGAffineTransform t,CGFloat sx, CGFloat sy)。
     
     1.1、 CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
     这个方法可以方便的对view的长和宽进行缩放，不改变view的中心点。(注意！中心点不变指的是物理位置不变，不是坐标，因为坐标系此时已经发生改变。)
     例如：对view进行0.5等比缩放：
     view.transform = CGAffineTransformMakeScale(0.5, 0.5);
     
     1.2、CGAffineTransformScale(CGAffineTransform t,CGFloat sx, CGFloat sy)
     这个方法同样是view的长和宽进行缩放，效果类似CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
     不同的是这个方法可以叠加其他CGAffineTransform效果（比如旋转）
     例如：对view进行0.5等比缩放：
     view.transform = CGAffineTransformScale(view.transform, 0.5, 0.5);
     
     
     2、transform旋转
     CGAffineTransform 提供了两个方法用于旋转，分别是：
     CGAffineTransform CGAffineTransformMakeRotation(CGFloat angle)
     CGAffineTransform CGAffineTransformRotate(CGAffineTransform t, CGFloat angle)。
     
     2.1 CGAffineTransformMakeRotation(CGFloat angle)
     这个方法可以方便的对view进行旋转，不改变view的中心点。注意！中心点不变指的是物理位置不变，不是坐标，因为坐标系此时已经发生改变。
     例如：对view进行45度旋转：
     view.transform = CGAffineTransformMakeRotation (M_PI_2);
     
     2.2 CGAffineTransformRotate(CGAffineTransform t, CGFloat angle)
     这个方法同样是对view进行旋转，效果类似 CGAffineTransformMakeRotation(CGFloat angle)
     不同的是这个方法可以叠加其他CGAffineTransform效果（比如缩放）
     例如：对view进行45度旋转：
     view.transform = CGAffineTransformRotate (view.transform, M_PI_2);

     */
    
    /*
     指定内容区域拉伸
     
     你可以用contentStretch属性来定义一个视图的可拉伸区域。这个属性的值一个边的值被标准化为0.0到1.0之间的矩形。当拉伸这个视图时，系统将视图的当前边界值和放缩因子乘以标准值，以便决定哪些像素需要被拉伸。使用标准值可以减轻每次改变视图的边界值都更新contentStretch属性的需要。
     
     视图的内容模式也在决定如何视图的可拉伸区域的使用中扮演着重要的角色。只有当内容模式可能绘引起视图内容放缩的时候可拉伸区域才会被使用。
     
     这意味这你的可拉伸视图只可UIViewContentModeScaleToFill,  UIViewContentModeScaleAspectFit 和 UIViewContentModeScaleAspectFill 内容模式。
     
     如果你指定了一个将内容弹到边界或者角落的内容模式（这样就没有真正的放缩内容），这个视图会忽视可拉伸区域。
     
     注意：当需要创建一个可拉伸UIImage对象作为视图的背景时，使用contentStretch属性是推荐的。可拉伸视图完全被Core Animation层处理，这样性能通常更好。
     */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.type == 0) {
        [self classAnimation];
    }else if (self.type == 1) {
        [self animation];
    }else if (self.type == 2) {
        [self springAnimation];
    }else if (self.type == 3) {
        [self keyFrameAnimation];
    }else if (self.type == 4) {
        [self tranStasionAnimation];
    }
}


/**
 类动画
 */
- (void)classAnimation{
    
    //动画开始标记
    /*
     第一个参数：动画标识
     第二个参数：附加参数，在设置了代理的情况下，此参数将发送到setAnimationWillStartSelector和setAnimationDidStopSelector所指定的方法。大部分情况下，我们设置为nil即可。
     */
    [UIView beginAnimations:@"FrameAni" context:nil];
    //动画持续时间
    [UIView setAnimationDuration:5.0];
    //设置动画延迟执行的时间
    [UIView setAnimationDelay:1.0];
    //动画的代理对象
    [UIView setAnimationDelegate:self];
    //设置动画将开始时代理对象执行的SEL
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    //设置动画将结束时代理对象执行的SEL
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    //设置动画的重复次数
    [UIView setAnimationRepeatCount:1];
    //设置动画的曲线
    /*
     UIViewAnimationCurve的枚举值如下：
     UIViewAnimationCurveEaseInOut,         // 慢进慢出（默认值）
     UIViewAnimationCurveEaseIn,            // 慢进
     UIViewAnimationCurveEaseOut,           // 慢出
     UIViewAnimationCurveLinear             // 匀速
     */
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.contentView.frame = self.imageView.frame;
    //设置是否从当前状态开始播放动画defaule == yes;
    /*
     假设上一个动画正在播放，且尚未播放完毕，我们将要进行一个新的动画：
     当为YES时：动画将从上一个动画所在的状态开始播放
     当为NO时：动画将从上一个动画所指定的最终状态开始播放（此时上一个动画马上结束）
     */
    [UIView setAnimationBeginsFromCurrentState:YES];
    //设置动画是否继续执行相反的动画,defaule == NO;
    [UIView setAnimationRepeatAutoreverses:NO];
    
    //设置视图的过渡效果
   /*
    第一个参数：UIViewAnimationTransition的枚举值如下
    UIViewAnimationTransitionNone,              //不使用动画
    UIViewAnimationTransitionFlipFromLeft,      //从左向右旋转翻页
    UIViewAnimationTransitionFlipFromRight,     //从右向左旋转翻页
    UIViewAnimationTransitionCurlUp,            //从下往上卷曲翻页
    UIViewAnimationTransitionCurlDown,          //从上往下卷曲翻页
    第二个参数：需要过渡效果的View
    第三个参数：是否使用视图缓存，YES：视图在开始和结束时渲染一次；NO：视图在每一帧都渲染
    */
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.contentView cache:YES];
    
    //结束动画标记
    [UIView commitAnimations];
}
//自定义开始动画方法
- (void)startAni:(NSString *)aniID {
    NSLog(@"%@ start",aniID);
}
//自定义结束动画方法
- (void)stopAni:(NSString *)aniID {
    NSLog(@"%@ stop",aniID);
}

/**
 基础动画
 */
- (void)animation{
    
    
    /*
     1、最简洁的Block动画：包含时间和动画
     [UIView animateWithDuration:(NSTimeInterval)  //动画持续时间
     animations:^{
     //执行的动画
     }];
     
     2、带有动画完成回调的Block动画
     [UIView animateWithDuration:(NSTimeInterval)  //动画持续时间
     animations:^{
     //执行的动画
     }                completion:^(BOOL finished) {
     //动画执行完毕后的操作
     }];
     
     3、可设置延迟时间和过渡效果的Block动画
     [UIView animateWithDuration:(NSTimeInterval) //动画持续时间
     delay:(NSTimeInterval) //动画延迟执行的时间
     options:(UIViewAnimationOptions) //动画的过渡效果
     animations:^{
     //执行的动画
     }                completion:^(BOOL finished) {
     //动画执行完毕后的操作
     }];

     */
    [UIView animateWithDuration:5 animations:^{
        self.contentView.center = CGPointMake(50, 400);
        self.contentView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.contentView.transform = CGAffineTransformRotate(self.contentView.transform, M_PI_2);
        self.contentView.alpha = 0.7;
    } completion:^(BOOL finished) {
    
    }];
}

/**
 弹簧动画
 */
- (void)springAnimation{
    
    [UIView animateWithDuration:5   //动画持续时间
                          delay:0   //动画延迟执行的时间
         usingSpringWithDamping:0.3 //震动效果，范围0~1，数值越小震动效果越明显
          initialSpringVelocity:0.5  //初始速度，数值越大初始速度越快
                        options:UIViewAnimationOptionLayoutSubviews     //动画的过渡效果
                     animations:^{
                         //执行的动画
                         //                         self.contentView.frame = CGRectMake(arc4random()%300, arc4random()%500, 80, 80);
                         //                         self.contentView.bounds = CGRectMake(arc4random()%300, arc4random()%500, 80, 80);
                         self.contentView.center = CGPointMake(100, 300);
                         self.contentView.transform = CGAffineTransformMakeScale(2, 2);
                         self.contentView.transform = CGAffineTransformRotate(self.contentView.transform, -M_PI_2);
                         self.contentView.alpha = 0.7;
                         
                     }
                     completion:^(BOOL finished) {
                         //动画执行完毕后的操作
                         NSLog(@"结束");
                     }];
}

/**
 关键帧动画
 */
- (void)keyFrameAnimation{
    
    
    /*增加关键帧的方法：
     [UIView addKeyframeWithRelativeStartTime:(double)//动画开始的时间（占总时间的比例）
     relativeDuration:(double) //动画持续时间（占总时间的比例）
     animations:^{
     //执行的动画
     }];
     */
    
    /*=======================================*/
    /*======1、UIView关键帧动画Block===========*/
    /*=======================================*/
    [UIView animateKeyframesWithDuration:5 delay:1 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            self.contentView.center = CGPointMake(self.contentView.center.x+100, self.contentView.center.y);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.5 animations:^{
            self.contentView.center = CGPointMake(self.contentView.center.x, self.contentView.center.y+100);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.7 animations:^{
            self.contentView.center = CGPointMake(self.contentView.center.x-100, self.contentView.center.y);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.7 relativeDuration:1 animations:^{
            self.contentView.center = CGPointMake(self.contentView.center.x, self.contentView.center.y-100);
        }];
        
    } completion:^(BOOL finished) {
        
    }];
}

/**
 转场动画
 */
- (void)tranStasionAnimation{
    /*
     1 从旧视图转到新视图的动画效果
     [UIView transitionFromView:(nonnull UIView *)
     toView:(nonnull UIView *)
     duration:(NSTimeInterval)
     options:(UIViewAnimationOptions)
     completion:^(BOOL finished) {
     //动画执行完毕后的操作
     }];
     
     在该动画过程中，fromView 会从父视图中移除，并将 toView 添加到父视图中，注意转场动画的作用对象是父视图（过渡效果体现在父视图上）。
     调用该方法相当于执行下面两句代码：
     [fromView.superview addSubview:toView];
     [fromView removeFromSuperview];
     
     2 单个视图的过渡效果
     [UIView transitionWithView:(nonnull UIView *)
     duration:(NSTimeInterval)
     options:(UIViewAnimationOptions)
     animations:^{
     //执行的动画
     }
     completion:^(BOOL finished) {
     //动画执行完毕后的操作
     }];
     */
    
    [UIView transitionFromView:self.contentView toView:self.TocontentView duration:5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        NSLog(@"转场完成！！！");
    }];
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(200, 100, 100, 50)];
        _contentView.backgroundColor = [UIColor redColor];
        _contentView.layer.cornerRadius = 10;
        _contentView.clipsToBounds = YES;
        _contentView.alpha = 0.3;
        
    }
    return  _contentView;
}

- (UIView *)TocontentView{
    if (!_TocontentView) {
        _TocontentView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 100, 50)];
        _TocontentView.backgroundColor = [UIColor blueColor];
        _TocontentView.layer.cornerRadius = 10;
        _TocontentView.clipsToBounds = YES;
        _TocontentView.alpha = 0.3;
        
    }
    return  _TocontentView;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 300, 300, 300)];
        _imageView.image = [UIImage imageNamed:@"朴信惠.jpg"];
    }
    return _imageView;
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
