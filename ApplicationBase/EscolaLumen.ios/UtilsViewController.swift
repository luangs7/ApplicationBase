//
//  UtilsViewController.swift
//  MyFirstApplication
//
//  Created by Luan Silva on 08/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit



extension UIViewController {
    
    @discardableResult func hideKeyboardWhenTappedAround(_ viewOrNil: UIView? = nil) -> UITapGestureRecognizer {
        var view: UIView!
        
        if viewOrNil == nil {
            view = self.view
        } else {
            view = viewOrNil!
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        return tap
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func presentAlertWith(_ message: String, title: String?) {
        var rTitle: String
        if (title == nil) {
            rTitle = ""
        } else {
            rTitle = title!
        }
        
        let errorAlert = UIAlertController(title: rTitle, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action:UIAlertAction!) in
            
            errorAlert.dismiss(animated: true, completion: nil)
        }
        errorAlert.addAction(OKAction)
        
        DispatchQueue.main.async {
            self.present(errorAlert, animated: true, completion:nil)
        }
    }
    
    func addBlur(blurView: UIView){
        
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        myActivityIndicator.startAnimating()
        
        blurView.frame = self.view.frame
        blurView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        myActivityIndicator.center = blurView.center
        blurView.addSubview(myActivityIndicator)
        
        view.addSubview(blurView)
    }
    
    func removeBlur(blurView: UIView) {
        if self.view.subviews.contains(blurView) {
            blurView.removeFromSuperview()
        }
    }


}
