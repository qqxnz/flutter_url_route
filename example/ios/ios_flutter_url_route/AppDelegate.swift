//
//  AppDelegate.swift
//  ios_flutter_url_route
//
//  Created by lv on 2019/10/22.
//  Copyright © 2019 lvfumei. All rights reserved.
//

import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {


    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window.makeKeyAndVisible()
        self.window.rootViewController = UINavigationController.init(rootViewController: ViewController())
        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }


}

