//
//  DemoVC.swift
//  MiNews
//
//  Created by Ami Zou on 4/26/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit
import Photos

class DemoVC: UIViewController {
    @IBOutlet weak var demoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadLastImageThumb()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLastImageThumb() { //completion: @escaping (UIImage) -> ()
        let imgManager = PHImageManager.default()
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 1
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
        
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        if let last = fetchResult.lastObject {
            let scale = UIScreen.main.scale
            let size = CGSize(width: 100 * scale, height: 100 * scale)
            let options = PHImageRequestOptions()
            
            
            imgManager.requestImage(for: last, targetSize: size, contentMode: PHImageContentMode.aspectFill, options: options, resultHandler: { (image, _) in
                //if let image = image {
                //completion(image)
                //}
                self.demoImg.image = image
            })
        }
        
    }
    
}
