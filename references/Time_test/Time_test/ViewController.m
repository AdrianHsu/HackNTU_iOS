//
//  ViewController.m
//  Time_test
//
//  Created by AdrianHsu on 2015/5/12.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import "ViewController.h"
#import "MZTimerLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel* aUILabel;
    /*MZTimerLabel *stopwatch = [[MZTimerLabel alloc] initWithLabel:aUILabel];
    [self.view addSubview:stopwatch];
    [stopwatch start];*/
    
    int input;
- (IBAction)restoreInput:(id)input
    {
        
    
    }
    MZTimerLabel *timer = [[MZTimerLabel alloc] initWithLabel:aUILabel andTimerType:MZTimerLabelTypeTimer];
    timer.frame = CGRectMake(100,50,100,20);
    timer.timeLabel.font = [UIFont systemFontOfSize:20.0f];
    timer.timeLabel.textColor = [UIColor redColor];
    [timer setCountDownTime:input];
    [self.view addSubview:timer];
    [timer start];
    
    /*MZTimerLabel *redStopwatch = [[MZTimerLabel alloc] init];
    redStopwatch.frame = CGRectMake(100,50,100,20);
    redStopwatch.timeLabel.font = [UIFont systemFontOfSize:20.0f];
    redStopwatch.timeLabel.textColor = [UIColor redColor];
    [self.view addSubview:redStopwatch];
    [redStopwatch start];*/
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
