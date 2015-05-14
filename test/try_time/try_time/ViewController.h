//
//  ViewController.h
//  try_time
//
//  Created by AdrianHsu on 2015/5/14.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *remainingTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *stopTimeButton;
/*- (IBAction)inputMinute:(UITextField *)sender;
- (IBAction)inputSecond:(UITextField *)sender;*/


- (IBAction)startButtonPushed:(id)sender;
@end

