//
//  ViewController.swift
//  TodoExample1
//
//  Created by 張 景隆 on 2015/4/9.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //var dataSource = []
    var dataSource = []
    
    //@IBOutlet weak var tableView: UITableView;
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.tableView.dataSource = self;
        loadData()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didSave", name: NSManagedObjectContextDidSaveNotification, object: nil)
        
    }
    
    func loadData() {
        // 取得 Context
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context = appDelegate.managedObjectContext!
        
        // 建立查詢目標
        var fetch = NSFetchRequest(entityName: "TodoItem")
        
        // 執行查詢
        var error: NSError?
        var request = context.executeFetchRequest(fetch, error: &error)
        
        // 將查詢結果 存入 data source
        if let result = request {
            self.dataSource = result
            self.tableView.reloadData()
        }
    }
    
    func didSave() {
        println("NSManagedObjectContextDidSaveNotification")
        
        loadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // 如果 Segue 準備跑到 toEdit 時 ...
        if segue.identifier == "toEdit" {
            var editViewController = segue.destinationViewController as! EditViewController
            editViewController.todoItem = sender as? TodoItem
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("todoCell") as! UITableViewCell
        
        var todoItem = self.dataSource[indexPath.row] as! TodoItem
        
        cell.textLabel?.text = todoItem.name
        
        return cell
    }
    
    // MARK: 刪除動作
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            // MARK: 處理刪除動作
            
            // 取得 todoItem
            var todoItem = self.dataSource[indexPath.row] as! TodoItem
            
            // 取得 Context
            var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            var context = appDelegate.managedObjectContext!
            
            // 刪除 todoItem
            context.deleteObject(todoItem)
            appDelegate.saveContext()
            
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
        var todoItem = self.dataSource[indexPath.row] as! TodoItem
        performSegueWithIdentifier("toEdit", sender: todoItem)
    }
    

}

