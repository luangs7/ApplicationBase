//
//  AppDelegate.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let result = UserDefaults.standard.value(forKey: "authSharedInstance")
        let userresult = UserDefaults.standard.value(forKey: "userSharedInstance")
       
        
        if userresult != nil {
        
        if let u = result {
            let us = u as! [String:Any]
            let usi = Request.sharedInstance
            let mUser = User.sharedInstance
            
            
            let request = (NSKeyedUnarchiver.unarchiveObject(with: userresult! as! Data) as? User)!
            
            mUser.nome = request.nome
            mUser.agenda = request.agenda
            mUser.alertas = request.alertas

//
            if let token = us["token"] as? String {
                usi.token = token
            }
            if let funcao = us["funcao"] as? String {
                usi.funcao = funcao
            }
            if let cdMatricula = us["cdMatricula"] as? String {
                usi.cdMatricula = cdMatricula
            }
            if let cdDispositivo = us["cdDispositivo"] as? String {
                usi.cdDispositivo = cdDispositivo
            }
            if let dtNascimento = us["dtNascimento"] as? String {
                usi.dtNascimento = dtNascimento
            }
            
            RequestService.login(usuario: usi) { (user, error) in
                guard let _ = user else {
                    return
                }
                
                mUser.agenda = user?.agenda
                mUser.alertas = user?.alertas
                mUser.nome = user?.nome
                
        
                
            }
            
            let agenda = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as! HomeViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = agenda 
            self.window?.makeKeyAndVisible()
        
            
            }
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

