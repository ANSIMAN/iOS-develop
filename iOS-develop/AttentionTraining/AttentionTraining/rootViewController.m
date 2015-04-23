//
//  rootViewController.m
//  AttentionTraining
//
//  Created by ZhouJiaming on 15/4/21.
//  Copyright (c) 2015年 ZhouJiaming. All rights reserved.
//

#import "rootViewController.h"
#import "trianingViewController.h"
//#import "SettingViewController.h"
#import "listViewController.h"
#define buttonCount 3
#define WIDTH (self.view.frame.size.width)
#define HEIGHT (self.view.frame.size.height)
#define ButtonHeight HEIGHT/10
#define ButtonWidth WIDTH/2
#define xOrigion ButtonWidth/2
#define yOrigion HEIGHT/6

#define distanceOfEachButton ButtonHeight/1.5
@interface rootViewController ()

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
-(void)createUI
{
    NSString *imageName=[NSString stringWithFormat:@"background.jpg"];
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    
    ImageView.image = [UIImage imageNamed:imageName];
    [self.view addSubview:ImageView];

    NSArray *array =@[@"开始训练",@"用户设置",@"使用帮助"];
    for(NSInteger i = 0;i<buttonCount;++i)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(xOrigion , yOrigion + (ButtonHeight+distanceOfEachButton) * i, WIDTH/2, HEIGHT/20);
        button.backgroundColor = [UIColor greenColor];
        button.tag = 300+i;
        [button addTarget:self action:@selector(onRootButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
 
    
}
-(void)onRootButton:(UIButton*)sender
{
    //tag 300+
    switch (sender.tag)
    {
        case 300:
            //开始训练 跳转到训练界面
        {
            NSLog(@"HEHE");
            trianingViewController *tvc= [[trianingViewController alloc]init];
            [self presentViewController:tvc animated:YES completion:^{}];
            break;
        }
        case 301:
        {
            
            //用户设置
            listViewController *svt = [[listViewController alloc]init];
            [self presentViewController:svt animated:YES completion:^{}];
            break;
            
        }
        default:
            break;
    }
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
