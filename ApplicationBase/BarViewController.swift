//
//  BarViewController.swift
//  ApplicationBase
//
//  Created by Luan Silva on 06/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class BarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: hexStringToUIColor(hex: "#ffffff")], for:.selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: hexStringToUIColor(hex: "#c2c2c2")], for:.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont(name: "Verdana", size: 10)!], for:.selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont(name: "Verdana", size: 11)!], for:.normal)
        
        // Dispose of any resources that can be recreated.
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
