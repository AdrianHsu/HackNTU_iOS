//
//  ProfileViewController.m
//  Utime
//
//  Created by AdrianHsu on 2015/5/17.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    
}

- (UIView *)inputAccessoryView{
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle = UIBarStyleDefault;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolbar setItems:@[cancel, space, done]];
    
    return toolbar;
}

- (UIView *)inputView{
    return self.datePicker;
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) done:(id)sender{
    
    [self resignFirstResponder];
}

- (void) cancel:(id)sender{
    [self resignFirstResponder];
}

- (IBAction)SetTime:(id)sender {
    [self becomeFirstResponder];
}

- (IBAction)StartCountown:(id)sender {
}
@end
