//
//  ViewController.swift
//  WhereAmI
//
//  Created by 張 景隆 on 2015/5/1.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.delegate = self
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
        
        // 開始更新使用者位置
        manager.startUpdatingLocation()
    }
    
    /*
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        println("ViewController.viewDidAppear")
        if let location = MyLocationManager.sharedManager.currentLocation {
            var coo = location.coordinate
            println("MyLocationManager.sharedManager.currentLocation => \(coo.latitude),\(coo.longitude)")
        }
    }
    */
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //
        println("didUpdateLocations")
//        println(locations)
        
        if let location = locations.first as? CLLocation {
            var coo = location.coordinate
            println("\(coo.latitude),\(coo.longitude)")
            
        }
        
    }
    
    // MARK: - UIGestureRecognizer
    @IBAction func longPressed(gesture: UILongPressGestureRecognizer) {
        println("long pressed!")
        if gesture.state == .Began {
            var touchPoint = gesture.locationInView(mapView)
            var coordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
            
            println("add point")
            var pointAnnotation = MKPointAnnotation()
            pointAnnotation.coordinate = coordinate
            pointAnnotation.title = "This is title."
            pointAnnotation.subtitle = "Subtitle."
            
            mapView.addAnnotation(pointAnnotation)
        }
    }
    
    // MARK: - MKMapViewDelegate
    // 座標更新時
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        //
        var coo = userLocation.coordinate
        println("\(coo.latitude),\(coo.longitude)")
        
        // 取得座標後 停止更新
        manager.stopUpdatingLocation()
        
        // 座標轉地址
        reverseGeocoder(userLocation.location)
    }
    
    // 取得使用者座標發生錯誤時
    func mapView(mapView: MKMapView!, didFailToLocateUserWithError error: NSError!) {
        //
        manager.stopUpdatingLocation()
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        //
        
        // 如果是 使用者目前位置的小藍點 則 使用它原本的 Annotations
        if annotation.isKindOfClass(MKUserLocation.classForCoder()) {
            return nil
        }
        
        var annotationView = MKPinAnnotationView()
        annotationView.annotation = annotation
        
        annotationView.animatesDrop = true
        
        annotationView.pinColor = .Purple // Red, Green, Purple
        
        annotationView.canShowCallout = true
        
        annotationView.draggable = true
        
        annotationView.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
        
        return annotationView
    }

    
    // MARK: - Geocoder
    func reverseGeocoder(location:CLLocation) {
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            //
            println("reverseGeocodeLocation")
            if let placemark = placemarks.first as? CLPlacemark {
                
                println(placemark.addressDictionary)
                
                if let lines = placemark.addressDictionary["FormattedAddressLines"] as? NSArray {
                    var formattedAddress = lines.componentsJoinedByString(",")

                    println("FormattedAddressLines \(formattedAddress)")
                }
            }
        })

    }
    
    // MARK: - 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

