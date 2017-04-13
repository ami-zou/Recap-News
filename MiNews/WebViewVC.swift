//
//  WebViewVC.swift
//  MiNews
//
//  Created by Ami Zou on 4/13/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(URLRequest(url:URL(string:url!)!))
        
    }

}
