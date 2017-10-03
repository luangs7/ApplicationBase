//
//  LoginViewController.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var dtnascimento: UITextField!
    @IBOutlet weak var codigo: UITextField!
    let blurView = UIView()
    @IBAction func submit(_ sender: Any) {
        getdata()
    }
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
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
//        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
//        self.submit.addGestureRecognizer(gesture)
//        self.forgot.addGestureRecognizer(gesture2)
        
    }

    
    override func presentAlertWith(_ message: String?, title: String?) {
        var rTitle: String
        var rMessage : String
        if (title == nil) {
            rTitle = ""
        } else {
            rTitle = title!
        }
        
        if(message != nil){
            rMessage = message!
        }else{
            rMessage = ""
        }
        
        let errorAlert = UIAlertController(title: rTitle, message: rMessage, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action:UIAlertAction!) in
            
            errorAlert.dismiss(animated: true, completion: nil)
        }
        errorAlert.addAction(OKAction)
        
        DispatchQueue.main.async {
            self.present(errorAlert, animated: true, completion:nil)
        }
    }
    
    
    func getdata(){
        
        let request = Request()
        request.cdMatricula = codigo.text!
        request.dtNascimento = dtnascimento.text!
        request.funcao = "GETUSER"
        addBlur(blurView: self.blurView)
        
        
        RequestService.login(usuario: request) { (user, error) in
            
            guard let user = user else {
                if let error = error {
                    self.presentAlertWith("\(error.domain)", title: "")
                }
                self.removeBlur(blurView: self.blurView)
                return
            }
            
            let useri = User.sharedInstance
            useri.agenda = user.agenda
            useri.alertas = user.alertas
            useri.nome = user.nome
            
            
            self.removeBlur(blurView: self.blurView)
            
            let userData = NSKeyedArchiver.archivedData(withRootObject: useri)
            let userDefaults = UserDefaults.standard
            userDefaults.setValue(userData, forKey: "userSharedInstance")
            userDefaults.synchronize()
            
            userDefaults.setValue(request.toDictionary(), forKey: "authSharedInstance")
            userDefaults.synchronize()
            
            
            self.performSegue(withIdentifier: "loginSend", sender: nil)
        }
        
        
        
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
