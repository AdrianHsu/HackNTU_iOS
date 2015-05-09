//
//  TodoItem.h
//  Utime
//
//  Created by AdrianHsu on 2015/5/9.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end

NSString