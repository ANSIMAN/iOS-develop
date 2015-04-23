//
//  RandomNumber.m
//  AttentionTraining
//
//  Created by ZhouJiaming on 15/4/20.
//  Copyright (c) 2015年 ZhouJiaming. All rights reserved.
//   类名：随机数
//  目的：生成一个不重复的随机数数列

#import "RandomNumber.h"

@implementation RandomNumber
@synthesize myMaxNumber;
@synthesize  array;

-(void)initWithMax:(int)max
{
//    NSLog(@"new 一个数组");
    array = [NSMutableArray new];
//    NSLog(@"设置最大值为 %i",max);
    myMaxNumber =max;
    for(int i =1;i<max+1;++i)
    {
        
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
//    NSLog(@"添加  %i 到 %i",1,max);
    [self makeArrayRandom];
}

-(void)makeArrayRandom
{
    if(myMaxNumber>0)
    {
        for(int index = 0;index<myMaxNumber;++index)
        {
            int randomIndex = arc4random()%myMaxNumber;
            
//            NSLog(@"array[%d]和 array[%d]交换",index,randomIndex);
            int tempValue = [array[randomIndex]intValue];
            
            array[randomIndex]=array[index];
            [array replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%d",tempValue]];
        }
//        NSLog(@"交换完毕");
    }
}

@end
