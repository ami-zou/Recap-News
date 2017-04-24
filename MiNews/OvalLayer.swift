//
//  OvalLayer.swift
//  MiNews
//
//  Created by Ami Zou on 4/13/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 0.3
    
    //let image = UIImage(named: "logo.png") // Assign your image
  
//    let imageSubLayer = CALayer()
//    imageSubLayer.contents = image?.CGImage
//    shape.addSublayer(imageSubLayer)
    
    override init() {
        super.init()
           //fillColor = Colors.clear.cgColor //change color here
        fillColor = UIColor(patternImage: #imageLiteral(resourceName: "star")).cgColor
        
        fillRule = kCAFillRuleEvenOdd
        
        contents = UIImage(named: "logo")?.cgImage
        
        //let image = #imageLiteral(resourceName: "logo")
        //let image = UIImage(named: "logo")?
        //let logoSubLayer = CALayer()
        //logoSubLayer.contents = image.cgImage
        //logoSubLayer.frame = self.bounds
        //logoSubLayer.mask = self
        //logoSubLayer.mask = logoSubLayer
        //addSublayer(logoSubLayer)
        
        path = ovalPathLarge.cgPath
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ovalPathSmall: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    
    var ovalPathLarge: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: -25.0, y: 0.0, width: 155.0, height: 155.0))
                                  //CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
    var ovalPathSquishVertical: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: -25.0, y: 5.0, width: 155.0, height: 145.0))
                                  //CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
    }
    
    var ovalPathSquishHorizontal: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: -20.0, y: 5.0, width: 145.0, height: 145.0))
                                  //CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
    }
    
    func expand() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalPathSmall.cgPath
        expandAnimation.toValue = ovalPathLarge.cgPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: nil)
    }
    
    func wobble() {
        //add picture first, then animation
        /*
        let image = #imageLiteral(resourceName: "logo")
        //let image = UIImage(named: "logo")?
        let logoSubLayer = CALayer()
        logoSubLayer.contents = image.cgImage
        addSublayer(logoSubLayer)
 */
 
        //1
        let wobbleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation1.fromValue = ovalPathLarge.cgPath
        wobbleAnimation1.toValue = ovalPathSquishVertical.cgPath
        wobbleAnimation1.beginTime = 0.0
        wobbleAnimation1.duration = animationDuration
        
        //2
        let wobbleAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation2.fromValue = ovalPathSquishVertical.cgPath
        wobbleAnimation2.toValue = ovalPathSquishHorizontal.cgPath
        wobbleAnimation2.beginTime = wobbleAnimation1.beginTime + wobbleAnimation1.duration
        wobbleAnimation2.duration = animationDuration
        
        //3
        let wobbleAnimation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation3.fromValue = ovalPathSquishHorizontal.cgPath
        wobbleAnimation3.toValue = ovalPathSquishVertical.cgPath
        wobbleAnimation3.beginTime = wobbleAnimation2.beginTime + wobbleAnimation2.duration
        wobbleAnimation3.duration = animationDuration
        
        //4
        let wobbleAnimation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation4.fromValue = ovalPathSquishVertical.cgPath
        wobbleAnimation4.toValue = ovalPathLarge.cgPath
        wobbleAnimation4.beginTime = wobbleAnimation3.beginTime + wobbleAnimation3.duration
        wobbleAnimation4.duration = animationDuration
        
        //5
        let wobbleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        wobbleAnimationGroup.animations = [wobbleAnimation1, wobbleAnimation2, wobbleAnimation3, wobbleAnimation4]
        wobbleAnimationGroup.duration = wobbleAnimation4.beginTime + wobbleAnimation4.duration
        wobbleAnimationGroup.repeatCount = 2
        
        add(wobbleAnimationGroup, forKey: nil)
    }
    
    func contract() {
        let contractAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        contractAnimation.fromValue = ovalPathLarge.cgPath
        contractAnimation.toValue = ovalPathSmall.cgPath
        contractAnimation.duration = animationDuration
        contractAnimation.fillMode = kCAFillModeForwards
        contractAnimation.isRemovedOnCompletion = false
        add(contractAnimation, forKey: nil)
    }
}
