//
//  Utils.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    static func toJsonServer(name: String, jsonToSend: [String:Any]) -> [String:Any]
    {
        var dictionary = [String:Any]()
        dictionary[name] = jsonToSend
        
        return dictionary
        
    }
    

}
