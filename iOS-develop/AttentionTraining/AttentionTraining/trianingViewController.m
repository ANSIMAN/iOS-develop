//
//  ViewController.m
//  AttentionTraining
//
//  Created by ZhouJiaming on 15/4/18.
//  Copyright (c) 2015年 ZhouJiaming. All rights reserved.
//

#import "trianingViewController.h"
#import "RandomNumber.h"
#import "rootViewController.h"
#define numberOfEveryLine 5
#define sumOfblock (numberOfEveryLine*numberOfEveryLine)
#define WIDTH (self.view.frame.size.width/numberOfEveryLine)
#define yOrigion self.view.frame.size.width

@interface trianingViewController ()
{
    // 定时器
    UILabel *_label;
    NSTimer *_timer;
    //
    BOOL isRunning;
}
@end

@implementation trianingViewController
{
    int currentNumber;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    currentNumber = 0;
    isRunning = NO;
    [self createUI];
}
-(void)createUI
{
    self.view.backgroundColor=[UIColor whiteColor];
    [self addGrid];
    [self createTimer];
    [self displayTimer];
    [self startButton];
    [self returnButton];
}

-(void)addGrid
{
    RandomNumber *rand= [RandomNumber new];
    [rand initWithMax:sumOfblock];

    for (int row=0;row<numberOfEveryLine;++row)
    {
        for(int col = 0;col<numberOfEveryLine;++col)
        {
            int integer=row*numberOfEveryLine+col;
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame=CGRectMake(WIDTH*row, WIDTH*col, WIDTH, WIDTH);
            button.tag = 200+integer;
            NSLog(@"tag  = %d",200+integer);
            if(0==(col+row)%2)
            {
                button.backgroundColor = [UIColor whiteColor];
            }
            else
            {
                button.backgroundColor = [UIColor whiteColor];
            }
            NSString  *title = [NSString stringWithFormat:@"%@",(NSString*)[rand.array objectAtIndex:integer]];
            [button addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:28];
            button.titleLabel.textAlignment=NSTextAlignmentCenter;
            button.tintColor=[UIColor blackColor];
            
            [self.view addSubview:button];
        }
    }
}

-(void)createTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    //停止计数器
    [_timer setFireDate:[NSDate distantFuture]];
    
}
-(void)displayTimer
{
    _label  =[[UILabel alloc]initWithFrame:CGRectMake(20, WIDTH*numberOfEveryLine, 280, 160)];
    _label.backgroundColor = [UIColor whiteColor];
    _label.font =[UIFont systemFontOfSize:50];
    _label.text =@"0";
    _label.textAlignment  = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
}
-(void)onTimer
{
    double value = [_label.text doubleValue]+0.01;
    _label.text = [NSString stringWithFormat:@"%.2f",value];
}


-(void)onBtnClick:(UIButton *) sender
{
    //点击事件
    if(!isRunning)
    if((currentNumber+1)==[[sender titleForState:UIControlStateNormal]intValue])
    {
        currentNumber++;
        if(currentNumber==sumOfblock)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"你赢了" message:@"不错嘛" delegate:nil cancelButtonTitle:@"残忍拒绝" otherButtonTitles:@"赏个好评", nil];
            [alertView show];
            //停止时间
            [_timer setFireDate:[NSDate distantFuture]];

            
            currentNumber = 0;
        }
    }
}
-(void)startButton
{
    UIButton *btnStart=[UIButton buttonWithType:UIButtonTypeSystem];
    btnStart.frame=CGRectMake(50, yOrigion, 100, 40);
    btnStart.backgroundColor=[UIColor yellowColor];
    [btnStart setTitle:@"开始" forState:UIControlStateNormal];
    btnStart.titleLabel.font=[UIFont systemFontOfSize:30];
    [btnStart addTarget:self action:@selector(onStartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btnStart.tag=100;
    [self.view addSubview:btnStart];
    
}
-(void)returnButton
{
    UIButton *btnStart=[UIButton buttonWithType:UIButtonTypeSystem];
    btnStart.frame=CGRectMake(160, yOrigion, 100, 40);
    btnStart.backgroundColor=[UIColor yellowColor];
    [btnStart setTitle:@"返回" forState:UIControlStateNormal];
    btnStart.titleLabel.font=[UIFont systemFontOfSize:30];
    [btnStart addTarget:self action:@selector(onStartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btnStart.tag=101;
    [self.view addSubview:btnStart];
    
}

-(void)onStartBtnClick:(UIButton*)sender
{
//    [_timer setFireDate:[NSDate distantFuture]];
    if(100==sender.tag)
    {
        
        if([@"0"  isEqual: _label.text])
        {
            [_timer setFireDate:[NSDate distantPast]];
        
        }
        else
        {
            _label.text = @"0";
            [_timer setFireDate:[NSDate distantPast]];
            [self makeGridRandom];
        
        }
    }
    else
    {
        rootViewController *tvc= [[rootViewController alloc]init];
        [self presentViewController:tvc animated:YES completion:^{}];
   
    }
}


-(void)makeGridRandom
{
    for(int i =0;i<sumOfblock;++i)
    {
        int randomIndex = arc4random()%sumOfblock+200;
        
        UIButton *button = (UIButton*)[self.view viewWithTag:200+i];
        UIButton *change = (UIButton*)[self.view viewWithTag:randomIndex];
        NSLog(@"tag = %d randomNumber = %d",200+i,randomIndex);
        NSString *temp = [change titleForState:UIControlStateNormal];
        NSLog(@"%@",temp);
        [change setTitle:[NSString stringWithFormat:@"%@",[button titleForState:UIControlStateNormal]]forState:UIControlStateNormal];
        NSLog(@"%@",[change titleForState:UIControlStateNormal]);
        [button setTitle:[NSString stringWithFormat:@"%@",temp]forState:UIControlStateNormal];
        NSLog(@"%@",[button titleForState:UIControlStateNormal]);
     
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
