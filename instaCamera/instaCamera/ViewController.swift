//
//  ViewController.swift
//  instaCamera
//
//  Created by AdrianHsu on 2015/5/12.
//  Copyright (c) 2015 AdrianHsu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //建立AVCapture Session , 宣告為全域
    let captureSession = AVCaptureSession()
    var backCameraDevice: AVCaptureDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //取得 後鏡頭
        getBackCamera()
        //建立 Device Input
        let deviceInput = AVCaptureDeviceInput(device: backCameraDevice, error: nil)
        
        //將 Device Input 加入 Session
        captureSession.addInput(deviceInput)
        //建立 Device Output
        AVCaptureStillImageOutput()
        //將 Device Output 加入Session
        //建立 Preview Layer
        //將 Preview Layer 加入 view controller 的 Layer
        
        //最後告訴 Session 開始運行
        
        
    }
    
    //in xcode 下方的terminal 輸入 "po devices.count" 會是0 or 2（前、後鏡頭）


    //MARK: - 取得後鏡頭
    func getBackCamera() {
        
        let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeAudio) as![AVCaptureDevice]
        
        /*devices.filter { (includeElement) in
            return includeElement.position = .Back
        }*/
        //可替換為：
        /*devices.filter {
            return $0.position == .Back //類似argv[0] 取 $0, return 代表的是執行這個動作
        }
        //後半部分
        for device in devices {
            if device.position == .Back {
                backCameraDevice = device
            }
        }*/
        
        //此兩段可替換為一行：
        var backDevice = devices.filter {$0.position == .Back}.first
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

