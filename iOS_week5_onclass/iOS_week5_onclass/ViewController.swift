//
//  ViewController.swift
//  iOS_week5_onclass
//
//  Created by AdrianHsu on 2015/4/28.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

//TASK: Autolayout

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var testView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.testView.backgroundColor = UIColor.redColor()
        
        
        
//        self.testView.layer.backgroundColor = UIColor.redColor().CGColor
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

