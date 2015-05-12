//
//  ViewController.swift
//  SimpleCamera
//
//  Created by AdrianHsu on 2015/5/12.
//  Copyright (c) 2015年 AdrianHsu. All rights reserved.
//

import UIKit
//MARK: - UIImagePickerController in UIKit
//Camera
//PhotoLibrary
//SavedPhotoAlbum
//modalPresentationStyle
//CurrentContext


//Flexible space bar button item
//Add Missing Constraints

//MARK: - How to make a simple camera?

//UINavigationControllerDelegate is also required
class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    var imagePicker: UIImagePickerController! //optional, no need to unwrap, it must have value
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openPhotoLibrary(sender: AnyObject) {
        imagePicker = UIImagePickerController() // () is required
        imagePicker.sourceType = .PhotoLibrary //enum of imagePicker
        imagePicker.modalPresentationStyle = .CurrentContext
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    //MARK:- UIImagePickerControllerDelegate
    
    
    //func imagePickerController(picker123, didFinishPickingMediaWithInfo: aaa)
    //Dictionary<NSObject: AnyObject>
    
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject :AnyObject])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as?
        UIImage {
         
            imageView.image = image
        }
        //content mode View -> Mode -> Aspectfit or sth (how to select an album)
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func openCamera(sender: AnyObject) {
        imagePicker = UIImagePickerController() // () is required
        imagePicker.sourceType = .PhotoLibrary //enum of imagePicker
        imagePicker.modalPresentationStyle = .CurrentContext
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//change "sourcetype" into camera , then it's done

