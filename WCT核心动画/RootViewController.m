//
//  RootViewController.m
//  WCT核心动画
//
//  Created by four on 2017/11/7.
//  Copyright © 2017年 four. All rights reserved.
//

#import "RootViewController.h"

#import "ViewController.h"
#import "FlipViewController.h"
#import "UIViewAnimationVC.h"
#import "PathViewController.h"
#import "ShapeViewController.h"
//定义屏幕的宽和高
#define MainScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define MainScreenHeight ([UIScreen mainScreen].bounds.size.height)
@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tvContent;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"核心动画";
    [self.view addSubview:self.tvContent];
    
}

#pragma mark - UITableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }else if (section == 1) {
        return 5;
    }else if (section == 2){
        return 10;
    }else if (section == 3){
        return 1;
    }else {
        return 1;
    }
//    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"路径+动画小案例";
    }
    else if(section == 1) {
        return @"UIView动画";
    }else if(section == 2) {
        return @"Core Animation 核心动画";
    }else if(section == 3) {
        return @"路径绘制";
    }else {
        return @"ShapeLayer";
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"moreCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"0、测试基本动画";
        }
        else if (indexPath.row == 1) {
            cell.textLabel.text = @"1、测试弹力仿真动画效果（路径+关键帧）";
        }
        else if (indexPath.row == 2) {
            cell.textLabel.text = @"2、测试路径关键帧动画（画圈）";
        }
        else if (indexPath.row == 3) {
            cell.textLabel.text = @"3、测试路径关键帧动画（画弧）";
        }
        else if (indexPath.row == 4) {
            cell.textLabel.text = @"4、测试路径关键帧动画（画S）";
        }
        else if (indexPath.row == 5) {
            cell.textLabel.text = @"5、测试摇晃关键帧动画";
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"0、UIView类动画";
        }
        else if (indexPath.row == 1) {
            cell.textLabel.text = @"1、UIView基本block动画";
        }
        else if (indexPath.row == 2) {
            cell.textLabel.text = @"2、UIView的Spring动画";
        }
        else if (indexPath.row == 3) {
            cell.textLabel.text = @"3、UIView的KeyFrame动画";
        }
        else if (indexPath.row == 4) {
            cell.textLabel.text = @"4、UIView的Transition动画";
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"0、CAaseAnimation基本移动";
        }
        else if (indexPath.row == 1) {
            cell.textLabel.text = @"1、CAaseAnimation旋转）";
        }
        else if (indexPath.row == 2) {
            cell.textLabel.text = @"2、CAaseAnimation缩放";
        }
        else if (indexPath.row == 3) {
            cell.textLabel.text = @"3、CAaseAnimation组合动画";
        }
        else if (indexPath.row == 4) {
            cell.textLabel.text = @"4、CAaseAnimation阴影";
        }
        else if (indexPath.row == 5) {
            cell.textLabel.text = @"5、CAaseAnimation透明度";
        }
        else if (indexPath.row == 6) {
            cell.textLabel.text = @"6、CAKeyFrameAnimation关键帧动画";
        }
        else if (indexPath.row == 7) {
            cell.textLabel.text = @"7、CATransition转场动画";
        }
        else if (indexPath.row == 8) {
            cell.textLabel.text = @"8、CASpringAnimation弹簧动画";
        }
        else{
            cell.textLabel.text = @"9、CAAnimationGroup组合动画";
        }
    }else if (indexPath.section == 3){
        cell.textLabel.text = @"路径绘制";
    }else if (indexPath.section == 4){
        cell.textLabel.text = @"ShapeLayer";
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ViewController *vc = [[ViewController alloc] init];
            vc.type = 0;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1) {
            ViewController *vc = [[ViewController alloc] init];
            vc.type = 1;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2) {
            ViewController *vc = [[ViewController alloc] init];
            vc.type = 2;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 3) {
            ViewController *vc = [[ViewController alloc] init];
            vc.type = 3;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 4) {
            ViewController *vc = [[ViewController alloc] init];
            vc.type = 4;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 5) {
            ViewController *vc = [[ViewController alloc] init];
            vc.type = 5;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    else if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            UIViewAnimationVC *vc = [[UIViewAnimationVC alloc] init];
            vc.type = 0;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1) {
            UIViewAnimationVC *vc = [[UIViewAnimationVC alloc] init];
            vc.type = 1;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2) {
            UIViewAnimationVC *vc = [[UIViewAnimationVC alloc] init];
            vc.type = 2;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 3) {
            UIViewAnimationVC *vc = [[UIViewAnimationVC alloc] init];
            vc.type = 3;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 4) {
            UIViewAnimationVC *vc = [[UIViewAnimationVC alloc] init];
            vc.type = 4;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 0;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 1;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 2;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 3) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 3;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 4) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 4;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 5) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 5;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 6) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 6;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 7) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 7;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 8) {
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 8;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else{
            FlipViewController *vc = [[FlipViewController alloc] init];
            vc.type = 9;
            [self.navigationController pushViewController:vc animated:YES];
        }
       
    }else if (indexPath.section == 3) {
        PathViewController *vc = [[PathViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 4) {
        ShapeViewController *vc = [[ShapeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableView *)tvContent{
    if (!_tvContent) {
        _tvContent = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth, MainScreenHeight) style:UITableViewStylePlain];
        _tvContent.backgroundColor = [UIColor clearColor];
        _tvContent.delegate = self;
        _tvContent.dataSource = self;
        _tvContent.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tvContent;
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
