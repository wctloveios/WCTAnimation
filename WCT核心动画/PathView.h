//
//  PathView.h
//  WCT核心动画
//
//  Created by four on 2017/11/7.
//  Copyright © 2017年 four. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PathLayer.h"

@interface PathView : UIView

@property (nonatomic, assign) CGFloat progress;

@property (strong,nonatomic) PathLayer *pathLayer;

@end
