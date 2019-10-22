//
//  ViewController.swift
//  ios_flutter_url_route
//
//  Created by lv on 2019/10/22.
//  Copyright © 2019 lvfumei. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Native"
        self.view.backgroundColor = UIColor.white;
        
        let btn = UIButton.init(frame: CGRect.init(x: 100, y: 250, width: 150, height: 50))
        btn.setTitle("toFlutter", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(self.btnClicked), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if(self.navigationController?.viewControllers.first == self){
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        }else{
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        }
        
    }
    
    @objc func btnClicked(){
        let flutterView = NZFlutterViewController.init()
        flutterView.setInitialRoute("page1?message=Test&asdf=2")
        self.navigationController?.pushViewController(flutterView, animated: true)
    }
    
    
}

