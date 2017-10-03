//
//  Constraint.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class Constraint: NSObject {

    //MARK: - Constants
    #if RELEASE_VERSION
    static let url = ""
    #else
    static let url = "https://escolalumen.herokuapp.com/api/v1"
    #endif
    
    static let logout = "logout"
    static let changePassword = "changePassword"
    
}
