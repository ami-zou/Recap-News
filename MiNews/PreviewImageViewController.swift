//
//  PreviewImageViewController.swift
//  SimpleCameraDemo
//
//  Created by Duc Tran on 8/28/15.
//  Copyright (c) 2015 Developers Academy. All rights reserved.
//

import UIKit

class PreviewImageViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    init(image: UIImage)
    {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
    }


}
