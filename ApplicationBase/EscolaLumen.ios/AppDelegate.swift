//
//  AppDelegate.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 11/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let result = UserDefaults.standard.value(forKey: "userSharedInstance")
        
        if let u = result {
            let us = u as! [String:Any]
            let usi = User.sharedInstance
            
            if let authorization = us["authorization"] as? String {
                usi.authorization = authorization
            }
            if let birth = us["birthday"] as? String {
                usi.birthday = birth
            }
            if let email = us["email"] as? String {
                usi.email = email
            }
            if let identifier = us["identifier"] as? String {
                usi.identifier = identifier
            }
            if let name = us["name"] as? String {
                usi.name = name
            }
            if let phone = us["phone"] as? String {
                usi.phone = phone
            }
            if let role = us["role"] as? String {
                usi.role = role
            }
            if let students = us["students"] as? Int {
                usi.students = students
            }
            
            RequestService.login(usuario: usi) { (user, error) in
                guard let _ = user else {
                    return
                }
            }

            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        }

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

