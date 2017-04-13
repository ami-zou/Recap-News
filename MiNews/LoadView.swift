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

class LoadView: UIView {
    var parentFrame: CGRect = CGRect.zero
    weak var delegate: LoadViewDelegate?
    
    let ovalLayer = OvalLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.clear
        //return;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented");
    }
    
    func addOval(){
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: "wobbleOval",
                                               userInfo: nil, repeats: false)
    }
    
    func wobbleOval(){
        ovalLayer.wobble()
    }
}
