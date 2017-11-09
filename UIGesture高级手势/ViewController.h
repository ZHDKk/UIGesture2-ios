//
//  ViewController.h
//  UIGesture高级手势
//
//  Created by zh dk on 2017/8/23.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

{
    //定义一个缩放手势,用来对视图放大缩小;捏合手势
    UIPinchGestureRecognizer * pinchGes;
    
    //定义一个旋转手势，主要用来旋转图片
    UIRotationGestureRecognizer *rotGes;
}
@end

