//
//  ShapeViewController.m
//  WCT核心动画
//
//  Created by four on 2017/11/8.
//  Copyright © 2017年 four. All rights reserved.
//

#import "ShapeViewController.h"

#import "ShapeView.h"
//定义屏幕的宽和高
#define MainScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define MainScreenHeight ([UIScreen mainScreen].bounds.size.height)
@interface ShapeViewController ()

@property (nonatomic,strong) ShapeView *shapeView;

@end

@implementation ShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ShapeLayer";
    
    [self.view addSubview:self.shapeView];
    /*
     一、CAShapeLayer的简介：
     
     CAShapeLayer顾名思义，就是代表一个形状（Shape）的Layer，它是CALayer的子类。
     CAShapeLayer初始化需要指定Frame，但它的形状是由path属性来决定，且必须指定path，不然会没有形状。
     
     
     二、CAShapeLayer的重要属性：
     1、lineWidth 渲染线的宽度
     2、lineCap、lineJoin 渲染线两端和转角的样式
     3、fillColor、strokeColor 填充、描边的渲染颜色
     4、path 指定的绘图路径，path不完整会自动封闭区域
     5、strokeStart、strokeEnd 绘制path的起始和结束的百分比
     
     
     三、CAShapeLayer的动画特点：
     1、CAShapeLayer跟CALayer一样自带动画效果
     2、CAShapeLayer的动画效果仅限沿路径变化，不支持填充区域的动画效果
     */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.shapeView startAnimation];
}

- (ShapeView *)shapeView{
    
    if (!_shapeView) {
        _shapeView = [[ShapeView alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth, MainScreenHeight/3.0*2)];
    }
    return _shapeView;
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
