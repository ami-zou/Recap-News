//
//  ReportVC.swift
//  MiNews
//
//  Created by Ami Zou on 4/17/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit
import Photos

class ReportVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var hashTitle: UITextField!
    
    //@IBOutlet weak var photoButton: UIButton!
    
    //@IBOutlet weak var galleryButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var story: UITextView!
    
    @IBOutlet weak var demoImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        story.layer.cornerRadius = 5
        //fetchImage();
        loadLastImageThumb()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func submitStory(_ sender: Any) {
        let alert = UIAlertController(title: "Recap Alert", message: "Congratulations! Your story has been succesfully submitted! We'll notify you if your story is been used.", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "good", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        
        self.present(alert, animated: true, completion: nil)
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
 /*
    func fetchImage(){
        let imgManager = PHImageManager.default()
        var fetchOptions = PHFetchOptions()
     
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: true)]
     
        if let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions){
            imgManager.requestImageForAsset(fetchResult.lastObject as PHAsset, targetSize: self.destinationImageView.frame.size, contentMode: PHImageContentMode.AspectFill, options: nil, resultHandler: { (image, _) in
                self.demoImg.image = image
            })
        }
    }
*/
 /*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, edittingInfo : [NSObject : AnyObject]!) { //remember to unwrap ("!") it
        
        
        demoImg.image = image
        self.dismiss(animated: true, completion: nil); //put ";" here
        
    }
*/
/*
    @IBAction func selectPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary; //don't forget ";"
            imagePicker.allowsEditing = true //can edit
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
*/    

}
