//
//  ViewController.m
//  SclloviewAD
//
//  Created by hao on 16/5/19.
//  Copyright © 2016年 hao. All rights reserved.
//

#import "ViewController.h"
#import "QuAD.h"
#import "QuViewController.h"
@interface ViewController ()
{
    QuViewController *view;
}
@property(nonatomic,strong) QuAD *ad;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

    
    
}
- (IBAction)goAd:(id)sender {
    self.ad = [[QuAD alloc]init];
    //开始动画
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:1];
    //设置动画淡入淡出
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //设置代理
    [UIView setAnimationDelegate:self];
    
    self.ad.alpha = 1.0;
    
    [self.view.window addSubview:self.ad];

    //动画结束
    [UIView commitAnimations];
     
    self.ad.complat = ^(int *page){
        [self.ad removeFromSuperview];
        [self performSegueWithIdentifier:@"two" sender:self];
        NSLog(@"----%d",page);
        
    };
    
    self.ad.dissplay = ^(NSString *abc){
        [self.ad removeFromSuperview];
        self.ad =nil;
    };

    self.ad.pushView = ^(NSString *bb){
        [self.ad removeFromSuperview];
        [self performSegueWithIdentifier:@"two" sender:self];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
