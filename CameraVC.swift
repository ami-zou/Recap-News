//
//  CameraVC.swift
//  MiNews
//
//  Created by Ami Zou on 3/17/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class CameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cameraButtonAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false //can't edit
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func photosButtonAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary; //don't forget ";"
            imagePicker.allowsEditing = true //can edit
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        let imageData = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
        let compressedJEPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJEPGImage!, nil, nil, nil)
        saveNotice()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, edittingInfo : [NSObject : AnyObject]!) { //remember to unwrap ("!") it
        pickedImage.image = image
        self.dismiss(animated: true, completion: nil); //put ";" here
    }
    
    func saveNotice(){
        let alertController = UIAlertController(title: "Image Saved!", message: "Your picture was successfully saved!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
