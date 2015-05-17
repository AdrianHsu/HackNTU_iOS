//
//  TableViewController.m
//  Utime
//
//  Created by AdrianHsu on 2015/5/17.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface TableViewController() <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(void) loadData {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    // 建立查詢目標
    NSFetchRequest* fetch = [NSFetchRequest fetchRequestWithEntityName:@"MissionItem"];
    
    // 執行查詢
    NSError* error = [[NSError alloc] init];
    NSPersistentStoreResult* result =  [context executeRequest:fetch error: &error];

//    NSPersistentStoreResult* result = request;
    if(!result) {
        self.dataSource = (NSArray *) result;
        [self.tableView reloadData];
    }
    
    // 將查詢結果 存入 data source
//    if let result = request {
//        self.dataSource = result
//        self.tableView.reloadData()
}

@end
