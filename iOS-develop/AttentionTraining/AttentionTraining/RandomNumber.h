//
//  RandomNumber.h
//  AttentionTraining
//
//  Created by ZhouJiaming on 15/4/20.
//  Copyright (c) 2015年 ZhouJiaming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomNumber : NSObject
@property NSInteger myMaxNumber;
@property NSMutableArray *array;

-(void)initWithMax:(int)max;
-(void)makeArrayRandom;

@end
