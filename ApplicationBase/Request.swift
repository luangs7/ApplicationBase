//
//  User.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class Request: NSObject {
    
    
    
    var token: String = "segredo"
    var funcao: String = ""
    var cdMatricula: String = ""
    var cdDispositivo: String = "100"
    var dtNascimento: String = ""
    
    let authDefaultsKey = "authShared"
    static let sharedInstance = Request()
    
    override init() {
        
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
     
        if token != nil{
            dictionary["token"] = token
        }
        if funcao != nil{
            dictionary["funcao"] = funcao
        }
        if cdMatricula != nil{
            dictionary["cdMatricula"] = cdMatricula
        }
        if cdDispositivo != nil{
            dictionary["cdDispositivo"] = cdDispositivo
        }
        if dtNascimento != nil{
            dictionary["dtNascimento"] = dtNascimento
        }
        return dictionary
    }
    
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        token = (aDecoder.decodeObject(forKey: "token") as? String)!
        funcao = (aDecoder.decodeObject(forKey: "funcao") as? String)!
        cdMatricula = (aDecoder.decodeObject(forKey: "cdMatricula") as? String)!
        cdDispositivo = (aDecoder.decodeObject(forKey: "cdDispositivo") as? String)!
        dtNascimento = (aDecoder.decodeObject(forKey: "dtNascimento") as? String)!

        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if token != nil{
            aCoder.encode(token, forKey: "token")
        }
        if funcao != nil{
            aCoder.encode(funcao, forKey: "funcao")
        }
        if cdMatricula != nil{
            aCoder.encode(cdMatricula, forKey: "cdMatricula")
        }
        if cdDispositivo != nil{
            aCoder.encode(cdDispositivo, forKey: "cdDispositivo")
        }
        if dtNascimento != nil{
            aCoder.encode(dtNascimento, forKey: "dtNascimento")
        }
        
    }

}
