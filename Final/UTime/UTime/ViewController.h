//
//  ViewController.h
//  Utime
//
//  Created by AdrianHsu on 2015/5/9.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@interface Myclass: NSObject
{
    int count;
    NSString *name;
}