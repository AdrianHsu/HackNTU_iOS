//
//  MyLocationManager.swift
//  WhereAmI
//
//  Created by 張 景隆 on 2015/5/4.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreLocation

class MyLocationManager : NSObject, CLLocationManagerDelegate {
    
    private static let sharedInstance = MyLocationManager()
    
    class var sharedManager : MyLocationManager {
        return sharedInstance
    }
    
    
    //
    private let manager = CLLocationManager()
    var currentLocation:CLLocation?
    private var updateLocationClosure:( (CLLocation) -> () )?
    
    override init() {
        super.init()
        
        self.manager.delegate = self
        
        // 如果 使用者尚未決定 是否提供座標，則詢問使用者
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestWhenInUseAuthorization()
        }
        
        // 如果使用者 拒絕提供座標，但是又需要座標才能提供的功能時，提醒他去設定開啟提供。
        if CLLocationManager.authorizationStatus() == .Denied {
            
            // 可使用 UIAlertController 告知使用者 需開啟定位 才能使用某些功能
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        }
        
        // 設定精準度
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // 取得使用者位置
    func getUserLocation(updateLocationClosure: ((newLocation:CLLocation) -> Void)) {
        self.updateLocationClosure = updateLocationClosure
    
        self.manager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //
        println("MyLocationManager.didUpdateLocations")
        //        println(locations)
        
        if let location = locations.first as? CLLocation {
            var coo = location.coordinate
            println("\(coo.latitude),\(coo.longitude)")
            
            currentLocation = location
            
            self.manager.stopUpdatingLocation()
            
            self.updateLocationClosure?(location)
        }
        
    }
}
