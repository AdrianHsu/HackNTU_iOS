//
//  Profile_ViewController.m
//  UTime
//
//  Created by AdrianHsu on 2015/5/7.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import "Profile_ViewController.h"

@interface Profile_ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *Count_button;

@end

@implementation Profile_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = CGPointMake(160, 480);
    //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    [self.view addSubview:loginButton];*/
    
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

@end
