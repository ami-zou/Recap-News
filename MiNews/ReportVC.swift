//
//  ReportVC.swift
//  MiNews
//
//  Created by Ami Zou on 4/17/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class ReportVC: UIViewController {
    
    @IBOutlet weak var hashTitle: UITextField!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var galleryButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var story: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        story.layer.cornerRadius = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitStory(submitBotton: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Congratulations! Your story has been succesfully submitted!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Good", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
