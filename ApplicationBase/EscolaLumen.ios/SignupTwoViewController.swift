//
//  SignupTwoViewController.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 20/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class SignupTwoViewController: UIViewController {

    @IBOutlet weak var submit: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    let blurView = UIView()

    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.post(name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        
        NotificationCenter.default.post(name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: Setup
    fileprivate func setup(){
        hideKeyboardWhenTappedAround()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
        self.submit.addGestureRecognizer(gesture)
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        user.email = email.text
        user.exists = true
        user.password = password.text
        
        addBlur(blurView: self.blurView)
        
        
        RequestService.signup(usuario: user) { (user, error) in
            
            guard let user = user else {
                if let error = error {
                    self.presentAlertWith("\(error.domain)", title: "")
                }
                self.removeBlur(blurView: self.blurView)
                return
            }
            
//            let userSI = User.sharedInstance
//            userSI.email = user.email
//            userSI.name = user.name
//            userSI.authorization = user.authorization
//            userSI.birthday = user.birthday
//            userSI.identifier = user.identifier
//            userSI.phone = user.phone
//            userSI.role = user.role
//            userSI.students = user.students
//            
//            
            self.removeBlur(blurView: self.blurView)
//
//            let userDefaults = UserDefaults.standard
//            userDefaults.setValue(userSI.toDictionary(), forKey: "userSharedInstance")
//            userDefaults.synchronize()
            
            
            self.performSegue(withIdentifier: "ApproveSegue", sender: nil)
        }
        

        
        
    }


}
