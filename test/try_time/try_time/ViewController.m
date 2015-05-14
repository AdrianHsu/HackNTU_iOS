//
//  ViewController.m
//  try_time
//
//  Created by AdrianHsu on 2015/5/14.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//
#import "ViewController.h"

@interface ViewController()
{
//    UILabel *progress;
    NSTimer *timer;
    int currMinute;
    int currSeconds;
    int setMinute;
    int setSeconds;
}
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.remainingTimeLabel.textColor=[UIColor lightGrayColor];
    
    currMinute=0;
    setMinute=currMinute;
    currSeconds=0;
    setSeconds=currSeconds;
    [self.remainingTimeLabel setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];

    self.remainingTimeLabel.backgroundColor=[UIColor clearColor];
    // Do any additional setup after loading the view, typically from a nib.
//    [self start];
    
}
-(void)start
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}
-(void)stop
{
    [timer invalidate];
}
-(void)resetToInitialState
{
    [timer invalidate];
    currMinute=0;
    currSeconds=5;
    [self.remainingTimeLabel setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
}
-(void)timerFired
{
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1)
            [self.remainingTimeLabel setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
    }
    else
    {
        [self resetToInitialState];
        [self.stopTimeButton setTitle:@"Start" forState:UIControlStateNormal];
    }
}
/*- (IBAction)inputMinute:(UITextField *)sender {
    UITextField * text = (UITextField *) sender;
    currMinute = [text.text intValue];
    NSLog(@"%@", text.text);
    [self.remainingTimeLabel setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
}

- (IBAction)inputSecond:(UITextField *)sender {
}*/

- (IBAction)startButtonPushed:(id)sender {
    UIButton * button = (UIButton *) sender;
    if ([button.titleLabel.text isEqual: @"Start"]){
        [self start];
        [button setTitle:@"Stop" forState:UIControlStateNormal];
    }
    else if ([button.titleLabel.text isEqual: @"Stop"]){
        [self stop];
        [self resetToInitialState];
        [button setTitle:@"Start" forState:UIControlStateNormal];
    }
}
@end