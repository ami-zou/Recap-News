//
//  CameraView.swift
//  MiNews
//
//  Created by Ami Zou on 3/16/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var captureSession : AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    @IBOutlet var cameraView: UIView!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        var backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        var error : NSError?
      
        var input = AVCaptureDeviceInput(device: backCamera)
        //var input = AVCaptureDeviceInput()
       // do {
       //     input = try AVCaptureDeviceInput(device: backCamera)
       // }
       // catch {
       //     &error
       // }
        
        if error == nil && captureSession?.canAddInput(input){
            captureSession?.addInput(input)
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            captureSession?.canAddOutput(stillImageOutput){
                captureSession?.addOutput(stillImageOutput)
            }
            
            previewLayer = AVCaptureVideoPREviwLayer(session: captureSession)
            previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
            previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
            cameraView.layer.addSublayer(previewLayer)
            captureSession?.startRunning()
        }
        
    }
}
