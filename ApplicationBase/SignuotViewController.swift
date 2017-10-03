//
//  SignuotViewController.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class SignuotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logout = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login") as! LoginViewController
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(nil, forKey: "userSharedInstance")
        userDefaults.synchronize()

        
        self.present(logout, animated: true, completion: nil)

//        self.performSegue(withIdentifier: "signoutSend", sender: nil)

        // Do any additional setup after loading the view.
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

}
