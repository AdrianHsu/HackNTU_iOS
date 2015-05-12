//
//  NewViewController.swift
//  TodoExample1
//
//  Created by 張 景隆 on 2015/4/13.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreData

class NewViewController: UIViewController {

    @IBOutlet weak var todoNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doSave(sender: AnyObject) {
        var name = todoNameField.text
        
        if (name == "") {
            var alert = UIAlertController(title: "", message: "請輸入！", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
        else {
            // do save
            
            // 取得 Context
            var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            var context = appDelegate.managedObjectContext!
            
            // 建立 Entity
            var todoItem = NSEntityDescription.insertNewObjectForEntityForName("TodoItem", inManagedObjectContext: context) as! TodoItem
            todoItem.name = name
            
            // 儲存 Todo項目
            appDelegate.saveContext()
            
            // 返回上一頁
            self.navigationController?.popViewControllerAnimated(true)
            
        }
    }
}
