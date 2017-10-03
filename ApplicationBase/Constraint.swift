//
//  Constraint.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class Constraint: NSObject {
    //MARK: - Constants
    #if RELEASE_VERSION
    static let url = ""
    #else
    static let url = "http://sistema.grupomgt.com.br/ws/callWs.php"
    #endif
    
    static let logout = "logout"
    static let changePassword = "changePassword"
}
