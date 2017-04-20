//
//  LoadVC.swift
//  MiNews
//
//  Created by Ami Zou on 4/13/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class LoadVC: UIViewController, LoadViewDelegate {
    var holderView = LoadView(frame: CGRect.zero )
    
    //let myTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addHolderView()
        Timer.scheduledTimer(timeInterval: 2.85, target: self, selector: #selector(LoadVC.toPageView), userInfo: nil, repeats: false)
        //Timer.scheduledTimerWithTimeInterval(timeInterval(3), target: self, selector: "toPageView", userInfo: nil, repeats: false)
        //toPageView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func toPageView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pageVC = storyboard.instantiateViewController(withIdentifier: "PageVC") as! PageVC
        self.present(pageVC, animated: true, completion: nil)
        //self.navigationController?.pushViewController(PageVC, animated: true)
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        
        holderView.addOval()
    }
    
    func animateLabel() {
        
    }
    
    func addButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: view.bounds.height)
        button.addTarget(self, action: #selector(LoadVC.buttonPressed(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func buttonPressed(_ sender: UIButton!) {
        view.backgroundColor = Colors.white
        view.subviews.map({ $0.removeFromSuperview() })
        holderView = LoadView(frame: CGRect.zero)
        addHolderView()
    }

    
}
