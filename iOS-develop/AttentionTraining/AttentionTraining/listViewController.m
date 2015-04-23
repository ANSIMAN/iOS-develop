//
//  listViewController.m
//  AttentionTraining
//
//  Created by ZhouJiaming on 15/4/22.
//  Copyright (c) 2015年 ZhouJiaming. All rights reserved.
//

#import "listViewController.h"

@interface listViewController ()

@end

@implementation listViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self createUI];
}
//    UILabel *label = [[UILabel alloc]init];
//    label.frame=CGRectMake(0, 0, 750, 1344);
//     label.backgroundColor = [UIColor yellowColor];
//    label.text = @"ddddd";
//    label.font = [UIFont fontWithName:@"Helvetica" size:15];
//    [self.view addSubview:label];
-(void)createUI
{
    UILabel *label4 =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
//加阴影
//label4.shadowColor
    label4.text = @"when I was young I'd listen to the radio waiting for my favorite songs when they played i'd somg along,it make me smile";
    
    label4.numberOfLines =10;//显示行数
//label4.lineBreakMode = NSLineBreakByCharWrapping;
//label4.lineBreakMode = NSLineBreakByTruncatingMiddle;
//label4.font = [UIFont systemFontOfSize:20];
    label4.font = [UIFont fontWithName:@"Helvetica" size:15];
    label4.backgroundColor =[UIColor yellowColor];
    [self.view addSubview:label4];
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
