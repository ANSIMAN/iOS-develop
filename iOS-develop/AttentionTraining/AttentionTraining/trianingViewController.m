//
//  ViewController.m
//  AttentionTraining
//
//  Created by ZhouJiaming on 15/4/18.
//  Copyright (c) 2015年 ZhouJiaming. All rights reserved.
//

#import "trianingViewController.h"
#import "RandomNumber.h"
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
    // Do any additional setup after loading the view, typically from a nib.
    currentNumber = 0;
    isRunning = NO;
//    NSLog(@"即将添加格子");
    [self addGrid];
//    NSLog(@"即将创建时间");
    [self createTimer];
//    NSLog(@"即将创建时间显示标签");
    [self displayTimer];
//    NSLog(@"创建一个开始按钮");
    [self startButton];
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
                button.backgroundColor = [UIColor blueColor];
            }
            else
            {
                button.backgroundColor = [UIColor greenColor];
            }
            NSString  *title = [NSString stringWithFormat:@"%@",(NSString*)[rand.array objectAtIndex:integer]];
            [button addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:28];
            button.titleLabel.textAlignment=NSTextAlignmentCenter;
            
            [self.view addSubview:button];
        }
    }
}

-(void)createTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
//    NSLog(@"创建时间成功");
    //停止计数器
    [_timer setFireDate:[NSDate distantFuture]];
//    NSLog(@"停止时间");
    
}
-(void)displayTimer
{
    _label  =[[UILabel alloc]initWithFrame:CGRectMake(20, WIDTH*numberOfEveryLine, 280, 160)];
    _label.backgroundColor = [UIColor grayColor];
    _label.font =[UIFont systemFontOfSize:50];
    _label.text =@"0";
    _label.textAlignment  = NSTextAlignmentCenter;
    [self.view addSubview:_label];
//    NSLog(@"创建显示时间成功");
    
}
-(void)onTimer
{
    double value = [_label.text doubleValue]+0.01;
//    NSLog(@"时间加1");
    _label.text = [NSString stringWithFormat:@"%.2f",value];
//    NSLog(@"时间是 %f value ",value);
}


-(void)onBtnClick:(UIButton *) sender
{
    NSLog(@"你点击了%@",sender.titleLabel.text);
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
-(void)onStartBtnClick:(UIButton*)sender
{
//    [_timer setFireDate:[NSDate distantFuture]];
    NSLog(@"bbeng");
    if([@"0"  isEqual: _label.text])
    {
        NSLog(@"ad");
        [_timer setFireDate:[NSDate distantPast]];
        
    }
    else
    {
        NSLog(@"dagagd");
        _label.text = @"0";
        [_timer setFireDate:[NSDate distantPast]];
        [self makeGridRandom];
        
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
//        int tempValue = [array[randomIndex]intValue];
//        array[randomIndex]=array[index];
//        [array replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%d",tempValue]];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
