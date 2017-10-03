//
//  CheckViewController.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {

    
    @IBOutlet weak var submit: UIView!
    @IBOutlet weak var emai: UITextField!
     let blurView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
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
        self.emai.resignFirstResponder()
   
        
        NotificationCenter.default.post(name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: Setup
    fileprivate func setup(){
        hideKeyboardWhenTappedAround()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
        self.submit.addGestureRecognizer(gesture)

    }
    
    
    func someAction(_ sender:UITapGestureRecognizer){
        getdata()
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
        
        let user = User()
        user.email = emai.text!
        addBlur(blurView: self.blurView)

        RequestService.check(usuario: user) { (error) in
                if error != nil {
                    self.performSegue(withIdentifier: "signupSegue", sender: nil)
//                    self.presentAlertWith("\(String(describing: error!.domain))", title: "")
                }else{
                    let userSI = User.sharedInstance
                    userSI.email = user.email
                    self.performSegue(withIdentifier: "Pass", sender: nil)
            }
                self.removeBlur(blurView: self.blurView)
                return
            }
            
    }
    
}
