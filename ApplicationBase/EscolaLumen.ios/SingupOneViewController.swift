//
//  SingupOneViewController.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 20/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class SingupOneViewController: UIViewController {

    @IBOutlet weak var submit: UIView!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var name: UITextField!
    
    let user = User()
    
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
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signTwo") as! SignupTwoViewController
        
        user.name = name.text
        user.identifier = cpf.text
        user.phone = phone.text
        
        
        vc.user = user
        
        self.present(vc, animated: true, completion: nil)
        
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
