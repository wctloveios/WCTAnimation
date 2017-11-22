//
//  PathViewController.m
//  WCT核心动画
//
//  Created by four on 2017/11/7.
//  Copyright © 2017年 four. All rights reserved.
//

#import "PathViewController.h"

#import "PathView.h"

@interface PathViewController ()

@property (strong,nonatomic) UISlider *slider;

@property (strong,nonatomic) PathView *pathView;
@property (strong,nonatomic) PathView *pathView1;

@end

@implementation PathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"路径绘制之Quartz2D";
    self.view.backgroundColor = [UIColor redColor];
    self.view.alpha = 0.2;
    
    //添加在UIView上的动画
    self.pathView.progress = 0.7;
    [self.view addSubview:self.pathView];
    
    //添加在CALayer上动画
    self.pathView1.pathLayer.progress = 0.5;
    [self.view addSubview:self.pathView1];
    
    [self.view addSubview:self.slider];

    
    /*
     Quartz2D是iOS和OSX中的一个二维绘图引擎，这组API具有许多强大的功能，如：图形的绘制、透明层、阴影、颜色管理、反锯齿、PDF文档的管理等等。
     
     使用Quartz2D来绘制图形，需要知道的相关概念：
     
     一、Core Graphics
     Core Graphic是一套基于C的框架，用于一切绘图操作，UIKit就是基于Core Graphic实现的，因此它可以实现比UIKit更底层的功能。
     Core Graphic使用Quartz2D作为绘图引擎，因此Quartz2D其实是Core Graphic的一部分，这两个名词密不可分。
     
     二、图形上下文
     　　画画需要画布，Core Graphics工作是的“画布”就是图形上下文，它决定图形绘制成什么样子，并绘制到哪里去。在“画布”中，每个连续的绘制操作都可以看成添加一个“图层”到画布上，在运行中我们可以通过额外的绘制操作来叠加更多“图层”来形成复杂的图形。
     　　推荐使用UIView自动为我们准备好的图形上下文，因为自定义上下文会降低内存的使用效率，导致性能下降。当需要我们调用：UIGraphicsGetCurrentContext（）来获取图形上下文。
     
     三、路径（pathView里面查看）
     
     */
}

- (void)changeProgress:(UISlider *)slider{
    
    //添加在UIView上的动画
    self.pathView.progress = self.slider.value;
    [self.pathView setNeedsDisplay];
    
    //添加在CALayer上动画
    self.pathView1.pathLayer.progress = self.slider.value;
    [self.pathView1 setNeedsDisplay];

}

//添加在UIView上的动画
- (PathView *)pathView{
    
    if (!_pathView) {
        _pathView = [[PathView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2.0)];
        _pathView.progress = 0.5;
    }
    return _pathView;
}

//添加在CALayer上动画
- (PathView *)pathView1{
    if (!_pathView1) {
        _pathView1 = [[PathView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2.0, self.view.frame.size.width, self.view.frame.size.height/2.0)];
        _pathView1.pathLayer.progress = 0.5;
    }
    return _pathView1;
}

- (UISlider *)slider{
    if (!_slider) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 330, 300, 30)];
        [_slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
        _slider.maximumValue = 1.0;
        _slider.minimumValue = 0.0;
        //slider三个颜色
        _slider.backgroundColor = [UIColor greenColor];
        _slider.tintColor = [UIColor blueColor];
        _slider.thumbTintColor = [UIColor redColor];
        
        _slider.value = self.pathView.progress;
       
    }
    return _slider;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //  通过外部事件来改变它的弧度，并让其重绘（这里的例子时当点击屏幕的时候改变其弧度属性）
//    self.pathView.progress = 0.5;
//    [self.pathView setNeedsDisplay];
    
    /*
    小结：
    　　1）drawRect方法会执行view的重绘，但是drawRect方法不能手动调用(手动调用了也无效)，必须通过调用setNeedsDisplay让系统自动调该方法。
    
    　　2）实现自定义动画可以通过：O —>通过属性控制view的形状 —> 改变view的属性 —> 调用重绘方法 —> view的形状改变 —> O
     */
    
    
//    self.pathView1.progress += (arc4random() % 2 + 1) * 0.1;
//     self.pathView1.progress += self.pathView1.progress + 0.1;
    self.pathView1.progress = 1;
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
