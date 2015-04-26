//
//  ListViewController.m
//  Day06_AttentionTraining
//
//  Created by teacher on 15/4/22.
//  Copyright (c) 2015年 teacher. All rights reserved.
//

#import "ListViewController.h"

#import "rootViewController.h"




@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}
- (void)createUI
{

    
    UITextView *textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [textview setText:@"本应用注意力训练采用的是舒尔特方格, 舒尔特方格是全世界范围内最简单, 最有效也是最科学的注意力训练方法。训练过程中, 在儿童寻找目标数字时, 注意力是需要极度集中的, 把这短暂的高强度的集中精力过程反复练习, 大脑的集中注意力功能就会不断的加固, 提高。注意力水平越来越高"];
    [self.view addSubview:textview];
    textview.font = [UIFont systemFontOfSize:30];
    textview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    textview.tintColor = [UIColor redColor];
    //textview.backgroundColor=[UIColor redColor];
    ;
    textview.contentInset=UIEdgeInsetsMake(0, -6, 0, 0);
    
    UIButton *btnReturn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnReturn.frame=CGRectMake(110, self.view.frame.size.height-40, 100, 38);
    btnReturn.backgroundColor=[UIColor yellowColor];
    [btnReturn setTitle:@"返回" forState:UIControlStateNormal];
    btnReturn.titleLabel.font=[UIFont systemFontOfSize:30];
    [btnReturn addTarget:self action:@selector(onReturnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btnReturn.tag=101;
    [self.view addSubview:btnReturn];

}
-(void)onReturnBtnClick:(UIButton*)sender
{
    RootViewController *tvc= [[RootViewController alloc]init];
    [self presentViewController:tvc animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
