//
//  LoadView.swift
//  MiNews
//
//  Created by Ami Zou on 4/13/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

protocol LoadViewDelegate: class {
    func animateLabel()
}

class LoadView: UIView{
    var parentFrame: CGRect = CGRect.zero
    weak var delegate: LoadViewDelegate?
    
    let ovalLayer = OvalLayer()
    //let recLayer = RectangleLayer()
    
    let whiteRectangleLayer = RectangleLayer()
    let themeRectangleLayer = RectangleLayer()
    let blueRectangleLayer = RectangleLayer()
    let clearRectangleLayer = RectangleLayer()
    
    let logoLayer = CALayer()
    let image = #imageLiteral(resourceName: "logo")

    //imageLayer.contents = UIImage(named: "pic")?.CGImage
    //imageLayer.frame = view.bounds
    //imageLayer.mask = imageSubLayer
    //view.layer.addSublayer(imageLayer)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.clear //return;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) //fatalError("init(coder:) has not been implemented");
    }
    
    func addOval(){
        logoLayer.contents = image.cgImage
        logoLayer.frame = self.bounds
        logoLayer.mask = ovalLayer
        
        //ovalLayer.addSublayer(logoLayer)
        
        //ovalLayer.contents = image.cgImage
        
        layer.addSublayer(ovalLayer)
        //layer.addSublayer(logoLayer)
        
        //ovalLayer.expand()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(LoadView.wobbleOval),
                                               userInfo: nil, repeats: false)
    }
    
    func wobbleOval(){
        //1: add Rec and oval
        //layer.addSublayer(recLayer)
        ovalLayer.wobble()
        
        //2
        //Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(LoadView.drawAnimatedRec), userInfo: nil, repeats: false)
        
        //3
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(LoadView.spinAndTransform), userInfo: nil, repeats: false)
    }
    
    func contractOval(){
        ovalLayer.contract()
    }
    
    func drawAnimatedRec(){
        //layer.addSublayer(recLayer)
        //recLayer.animateStrokeWithColor(Colors.blue)
    }
    
    func spinAndTransform(){
        //1
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.6)  //CGPointMake(0.5, 0.6)
        
        //2
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transformation.rotation.z")
        rotationAnimation.toValue = CGFloat(Double.pi*2.0)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        layer.add(rotationAnimation, forKey: nil)
        
       
        
        //4:
        Timer.scheduledTimer(timeInterval: 0.45, target: self,
                                               selector: #selector(LoadView.drawBlueAnimatedRec),
                                               userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 0.95, target: self,
                                               selector: #selector(LoadView.drawThemeAnimatedRec),
                                               userInfo: nil, repeats: false)
        
        //3: Contract the Oval Layer
        Timer.scheduledTimer(timeInterval: 1.45, target: self, selector: #selector(LoadView.contractOval), userInfo: nil, repeats: false)
        //ovalLayer.contract()
        
        Timer.scheduledTimer(timeInterval: 1.60, target: self,
                             selector: #selector(LoadView.drawWhiteAnimatedRec),
                             userInfo: nil, repeats: false)
    }
    
    func drawThemeAnimatedRec(){
        layer.addSublayer(themeRectangleLayer)
        themeRectangleLayer.animateStrokeWithColor(Colors.theme)
    }
    
    func drawWhiteAnimatedRec(){
        layer.addSublayer(whiteRectangleLayer)
        whiteRectangleLayer.animateStrokeWithColor(Colors.white)
    }
    
    func drawBlueAnimatedRec(){
        layer.addSublayer(blueRectangleLayer)
        blueRectangleLayer.animateStrokeWithColor(Colors.blue)
    }
    
    func drawClearAnimatedRec(){
        layer.addSublayer(clearRectangleLayer)
        clearRectangleLayer.animateStrokeWithColor(Colors.clear)
    }
}
