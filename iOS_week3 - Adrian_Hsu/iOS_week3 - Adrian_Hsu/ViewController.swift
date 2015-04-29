//
//  ViewController.swift
//  iOS_week3 - Adrian_Hsu
//
//  Created by AdrianHsu on 2015/4/28.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.

// 1. 使用 NSUserDefault 儲存調色盤顏色
// 2. 使用 UIWebView 打造自己專屬瀏覽器
// mail 到：appletone.tw@gmail.com
// 標題：[HackCourse] iOS week3 - 姓名

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doChange(sender: AnyObject) {
        
        var color = UIColor(
            red: CGFloat(rSlider.value),
            green: CGFloat(gSlider.value),
            blue: CGFloat(bSlider.value),
            alpha: 1)
        
        self.view.backgroundColor = color
        
    }
}
