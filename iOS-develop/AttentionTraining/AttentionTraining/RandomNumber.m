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
    array = [NSMutableArray new];
    myMaxNumber =max;
    for(int i =1;i<max+1;++i)
    {
        
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self makeArrayRandom];
}

-(void)makeArrayRandom
{
    if(myMaxNumber>0)
    {
        for(int index = 0;index<myMaxNumber;++index)
        {
            int randomIndex = arc4random()%myMaxNumber;
            
            int tempValue = [array[randomIndex]intValue];
            
            array[randomIndex]=array[index];
            [array replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%d",tempValue]];
        }
    }
}

@end
