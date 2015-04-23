//
//  SettingViewController.m
//  AttentionTraining
//
//  Created by ZhouJiaming on 15/4/22.
//  Copyright (c) 2015年 ZhouJiaming. All rights reserved.
//

//#import "SettingViewController.h"
//
//@class rootViewController;
//
//#define viewHeight self.view.frame.size.height
//#define viewWidth self.view.frame.size.width
//#define buttonHeight self.view.frame.size.height/15
//#define buttonWidth self.view.frame.size.width/3
//#define buttonXorigion 10
//#define buttonYorigion viewHeight-buttonHeight
//

//@class trianingViewController;
//@interface SettingViewController ()
//@end
//
//@implementation SettingViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    [self createUI];
//    
//}
//-(void)createUI
//{
//    //创建两个按钮
//    NSArray *array = @[@"添加用户",@"完成"];
//    for(NSInteger i =0;i<2;++i)
//    {
//        self.view.backgroundColor = [UIColor whiteColor];
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//        if(0==i)
//        {
//            button.frame = CGRectMake(buttonXorigion, buttonYorigion, buttonWidth, buttonHeight-5);
//            button.tag = 100;
//        }
//        else
//        {
//            button.frame = CGRectMake(viewWidth-buttonWidth- buttonXorigion, buttonYorigion, buttonWidth, buttonHeight-5);
//            button.tag = 101;
//        }
//        button.backgroundColor = [UIColor greenColor];
//        button.tintColor=[UIColor whiteColor];
//        [button addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
//        
//        [self.view addSubview:button];
//        
//    }
//    //读取plist
//    NSString* plistPath = [[NSBundle mainBundle]pathForResource:@"Users" ofType:@"plist"];
//    NSMutableArray *usersArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
//
//    
//    if(![usersArray isEqualToArray:@[]])
//    {
//        for(NSInteger i = 0;i<array.count;i++)
//        {
//            UIButton *button = [[UIButton alloc]init];
//            button.frame = CGRectMake(0,i*buttonHeight*2 , viewWidth, buttonHeight*2);
//            [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
//            [self.view addSubview:button];
//        }
//    }
//    
//}
//
//-(void)btnOnClick:(UIButton *)sender
//{
//    switch (sender.tag) {
//        case 101:
//            //跳转
//            [self dismissViewControllerAnimated:YES completion:^{}];
//            break;
//        case 100:
//            //添加用户
//        {
//            NSString* plistPath = [[NSBundle mainBundle]pathForResource:@"Users" ofType:@"plist"];
//            NSMutableArray *usersArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
//
//            NSInteger i =usersArray.count;
//            
//            UIButton *btn = [[UIButton alloc]init];
//            btn.frame = CGRectMake(0,i*buttonHeight*2 , viewWidth, buttonHeight*2);
//            btn.backgroundColor = [UIColor greenColor];
//            [btn setTitle:[usersArray objectAtIndex:i] forState:UIControlStateNormal];
//            [self.view addSubview:btn];
//            
//            break;
//        }
//            
//        default:
//            break;
//    }
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
