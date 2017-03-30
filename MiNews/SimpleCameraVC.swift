//
//  SimpleCameraVC.swift
//  MiNews
//
//  Created by Ami Zou on 3/29/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import Foundation
import UIKit

class SimpleCameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        
    }
   
    @IBAction func selectPhoto(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
