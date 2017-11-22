//
//  FlipViewController.h
//  WCT核心动画
//
//  Created by four on 2017/11/2.
//  Copyright © 2017年 four. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipViewController : UIViewController

/**
     0基本移动
     1旋转
     2缩放
     3base组合动画
     4阴影
     5透明度
     6关键帧动画
     7转场动画
     8弹簧动画
     9group组合动画
 */
@property (nonatomic,assign) NSInteger type;

@end
