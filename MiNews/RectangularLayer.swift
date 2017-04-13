//
//  RectangularLayer.swift
//  MiNews
//
//  Created by Ami Zou on 4/13/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class RectangleLayer: CAShapeLayer {
    
    override init() {
        super.init()
        fillColor = Colors.clear.cgColor//Colors.white.cgColor
        lineWidth = 20.0
        path = rectanglePathFull.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var rectanglePathFull: UIBezierPath {
        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: -50.0, y: 180.0))
        rectanglePath.addLine(to: CGPoint(x: -50.0, y: -lineWidth))
        rectanglePath.addLine(to: CGPoint(x: 150.0, y: -lineWidth))
        rectanglePath.addLine(to: CGPoint(x: 150.0, y: 180.0))
        rectanglePath.addLine(to: CGPoint(x: -lineWidth / 2, y: 180.0))
        /*
         rectanglePath.move(to: CGPoint(x: 0.0, y: 100.0))
         rectanglePath.addLine(to: CGPoint(x: 0.0, y: -lineWidth))
         rectanglePath.addLine(to: CGPoint(x: 100.0, y: -lineWidth))
         rectanglePath.addLine(to: CGPoint(x: 100.0, y: 100.0))
         rectanglePath.addLine(to: CGPoint(x: -lineWidth / 2, y: 100.0))
        */
        rectanglePath.close()
        return rectanglePath
    }
    
    func animateStrokeWithColor(_ color: UIColor) {
        strokeColor = color.cgColor
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 3.0
        strokeAnimation.duration = 0.8 //0.4
        add(strokeAnimation, forKey: nil)
    }
    
}
