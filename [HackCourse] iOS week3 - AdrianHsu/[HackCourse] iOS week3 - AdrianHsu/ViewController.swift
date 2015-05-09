//
//  ViewController.swift
//  [HackCourse] iOS week3 - AdrianHsu
//
//  Created by AdrianHsu on 2015/5/10.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textURL: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBAction func buttonClick(sender: UIButton) {
        var str = textURL.text
        if !str.hasPrefix("http://"){
            str = "http://" + str
        }
        var url = NSURL(string: str)
        var request = NSURLRequest(URL: url!)
        webView!.loadRequest(request)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var url = NSURL(string: "https://adrianhsu.github.io")
        var request = NSURLRequest(URL: url!)
        webView!.loadRequest(request)
    }
    @IBAction func stop(sender: AnyObject) {
        webView!.stopLoading()
    }
    
    @IBAction func refresh(sender: AnyObject) {
        webView!.reload()
    }
    
    @IBAction func goBack(sender: AnyObject) {
        webView!.goBack()
    }
    
    @IBAction func goForward(sender: AnyObject) {
        webView!.goForward()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

