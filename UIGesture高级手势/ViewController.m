//
//  ViewController.m
//  UIGesture高级手势
//
//  Created by zh dk on 2017/8/23.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"3.jpg"];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame=CGRectMake(50, 80, 300, 450);
    
    imageView.userInteractionEnabled = YES;
    imageView.image = image;
    
    [self.view addSubview:imageView];
    
    //创建捏合手势
    pinchGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinAct:)];
    [imageView addGestureRecognizer:pinchGes];

    //创建旋转手势
    rotGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotAct:)];
    [imageView addGestureRecognizer:rotGes];
    
    //设置手势代理（旋转缩放同时进行）
    pinchGes.delegate = self;
    rotGes.delegate = self;
}

//捏合手势函数
-(void) pinAct:(UIPinchGestureRecognizer*) pinch{
    //获取监控图像视图
    UIImageView *imageView = (UIImageView*)pinchGes.view;
    //对图像视图对象进行矩阵变换计算并赋值   transform:表示图形学中的变换矩阵   CGAffineTransformScale
    //参数一：原来的矩阵。 参数二：x方向的缩放比例。 参数三：y方向的缩放比例额。   返回值时新的缩放后的矩阵变换
    imageView.transform = CGAffineTransformScale(imageView.transform, pinchGes.scale, pinchGes.scale);
    
    //将缩放值归位为单位值 ;=1原来的大小；<1缩小效果  ; >1放大效果
    pinchGes.scale = 1;
    
   
    
}

//是否可以同时响应两个手势  YES:可以。  NO：不可以
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void) rotAct:(UIRotationGestureRecognizer*) rot{
    UIImageView *imageView = (UIImageView*) rot.view;
    
    //计算旋转的变换矩阵
    imageView.transform = CGAffineTransformRotate(imageView.transform, rot.rotation);
    
    rot.rotation = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
