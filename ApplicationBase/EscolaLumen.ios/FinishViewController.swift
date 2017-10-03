//
//  FinishViewController.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 21/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    @IBOutlet weak var submit: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setup(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(CheckViewController.someAction(_:)))
        self.submit.addGestureRecognizer(gesture)
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
                   self.performSegue(withIdentifier: "returnLogin", sender: nil)
        }
}
