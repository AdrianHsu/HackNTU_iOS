//
//  ViewController.m
//  try_UITextField
//
//  Created by AdrianHsu on 2015/5/14.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>


@interface UIViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // UITextField初始化
    /*UITextField *dyTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,50,200,30)];*/
    
    // 設定預設文字內容
    self.dyTextField.text = @"Hello, Adrian!!";
    
    // 設定文字顏色
    self.dyTextField.textColor = [UIColor whiteColor];
    
    // Delegate
    self.dyTextField.delegate = self;
    
    // 設定輸入框背景顏色
    self.dyTextField.backgroundColor = [UIColor blueColor];
    
    // 框線樣式
    self.dyTextField.borderStyle =  UITextBorderStyleRoundedRect;
    
    // 將TextField加入View
    [self.view addSubview:self.dyTextField];
    
    
    // MARK:- UIAlertView
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello There!"
                                                    message:@"Welcome to Adrian's first app!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];*/

    // MARK:- Background
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"IMG_0332.jpg"]];
    
    
    /*
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0332.jpg"]];;
    backgroundView.frame = CGRectMake(-100, 0, 736, 736);
    [self.view sendSubviewToBack:(UIView*)backgroundView];
    [self.view addSubview:backgroundView];*/

    
    
    // 初始化(圖片為363x198，圖片太大將它縮為1/2)
    /*UIImageView *dyImageView = [[UIImageView alloc] initWithFrame: CGRectMake(-80,0,700,700)];
    
    // 圖片檔案引入UIImage物件(需要先將圖片加入專案中)
    // initWithNamed:@"cropped-Logo"]];
    UIImage *dyImage = [UIImage imageNamed:@"IMG_0332.jpg"];
    
    // 圖片影像物件指定至UIImageView之影象
    dyImageView.image = dyImage;
    
    // UIImageView加入主要View中
    [self.view addSubview:dyImageView];*/
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 設定delegate 為self後，可以自行增加delegate protocol
// 開始進入編輯狀態
- (void) textFieldDidBeginEditing:(UITextField*)textField {
    NSLog(@"textFieldDidBeginEditing:%@",textField.text);
}

// 可能進入結束編輯狀態
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing:%@",textField.text);
    return true;
}

// 結束編輯狀態(意指完成輸入或離開焦點)
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing:%@",textField.text);
}

// 按下Return後會反應的事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
    [textField resignFirstResponder];
    NSLog(@"按下Return");
    return false;
}


@end

