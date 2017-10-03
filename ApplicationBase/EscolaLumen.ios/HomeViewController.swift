//
//  HomeViewController.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 20/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var avisoView: UIView!
    @IBOutlet weak var galleryView: UIView!
    @IBOutlet weak var institucionalView: UIView!
    @IBOutlet weak var logoutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Setup
    fileprivate func setup(){
        hideKeyboardWhenTappedAround()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
        let avisoTap = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
        let galleryTap = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
        let institucionalTap = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))

        self.avisoView.addGestureRecognizer(avisoTap)
        self.galleryView.addGestureRecognizer(galleryTap)
        self.institucionalView.addGestureRecognizer(institucionalTap)
        self.logoutView.addGestureRecognizer(gesture)

        
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        
        if let tag = sender.view?.tag {
            if(tag == 0){
                self.performSegue(withIdentifier: "AvisoSend", sender: nil)
            }
            else if(tag == 1){
                self.performSegue(withIdentifier: "GaleriaSend", sender: nil)
            }else if(tag == 2){
                self.performSegue(withIdentifier: "InstitucionalSend", sender: nil)
            }else if(tag == 3){
                logout()
            }
            else{
                
            }
            
        }
        
    }
    
    func logout(){
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(nil, forKey: "userSharedInstance")
        userDefaults.synchronize()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! CheckViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = vc
        appDelegate.window?.makeKeyAndVisible()
    }
 

}
