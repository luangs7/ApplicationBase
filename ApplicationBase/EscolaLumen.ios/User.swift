//
//  User.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: NSObject {
    
    
    
    var authorization : String?
    var birthday : String?
    var currentPassword : String?
    var device : String?
    var email : String?
    var exists : Bool?
    var identifier : String?
    var name : String?
    var password : String?
    var passwordConfirmation : String?
    var phone : String?
    var plataform : String?
    var role : String?
    var students : Int?
    
    //MARK: - Constants
    let userDefaultsKey = "sharedArticle"
    static let sharedInstance = User()
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    
    override init() {
        self.birthday = ""
        self.device = ""
        self.authorization = ""
        self.identifier = ""
        self.role = ""
        self.phone = ""
        self.name = ""
        self.students = 0
        self.email = ""
        self.password = ""
        self.passwordConfirmation = ""
        self.plataform = ""
        self.exists = false
    }

    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        authorization = json["authorization"].stringValue
        birthday = json["birthday"].stringValue
        currentPassword = json["current_password"].stringValue
        device = json["device"].stringValue
        email = json["email"].stringValue
        exists = json["exists"].boolValue
        identifier = json["identifier"].stringValue
        name = json["name"].stringValue
        password = json["password"].stringValue
        passwordConfirmation = json["password_confirmation"].stringValue
        phone = json["phone"].stringValue
        plataform = json["plataform"].stringValue
        role = json["role"].stringValue
        students = json["students"].intValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if authorization != nil{
            dictionary["authorization"] = authorization
        }
        if birthday != nil{
            dictionary["birthday"] = birthday
        }
        if currentPassword != nil{
            dictionary["current_password"] = currentPassword
        }
        if device != nil{
            dictionary["device"] = device
        }
        if email != nil{
            dictionary["email"] = email
        }
        if exists != nil{
            dictionary["exists"] = exists
        }
        if identifier != nil{
            dictionary["identifier"] = identifier
        }
        if name != nil{
            dictionary["name"] = name
        }
        if password != nil{
            dictionary["password"] = password
        }
        if passwordConfirmation != nil{
            dictionary["password_confirmation"] = passwordConfirmation
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if plataform != nil{
            dictionary["plataform"] = plataform
        }
        if role != nil{
            dictionary["role"] = role
        }
        if students != nil{
            dictionary["students"] = students
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        authorization = aDecoder.decodeObject(forKey: "authorization") as? String
        birthday = aDecoder.decodeObject(forKey: "birthday") as? String
        currentPassword = aDecoder.decodeObject(forKey: "current_password") as? String
        device = aDecoder.decodeObject(forKey: "device") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        exists = aDecoder.decodeObject(forKey: "exists") as? Bool
        identifier = aDecoder.decodeObject(forKey: "identifier") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        password = aDecoder.decodeObject(forKey: "password") as? String
        passwordConfirmation = aDecoder.decodeObject(forKey: "password_confirmation") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        plataform = aDecoder.decodeObject(forKey: "plataform") as? String
        role = aDecoder.decodeObject(forKey: "role") as? String
        students = aDecoder.decodeObject(forKey: "students") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if authorization != nil{
            aCoder.encode(authorization, forKey: "authorization")
        }
        if birthday != nil{
            aCoder.encode(birthday, forKey: "birthday")
        }
        if currentPassword != nil{
            aCoder.encode(currentPassword, forKey: "current_password")
        }
        if device != nil{
            aCoder.encode(device, forKey: "device")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if exists != nil{
            aCoder.encode(exists, forKey: "exists")
        }
        if identifier != nil{
            aCoder.encode(identifier, forKey: "identifier")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if password != nil{
            aCoder.encode(password, forKey: "password")
        }
        if passwordConfirmation != nil{
            aCoder.encode(passwordConfirmation, forKey: "password_confirmation")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if plataform != nil{
            aCoder.encode(plataform, forKey: "plataform")
        }
        if role != nil{
            aCoder.encode(role, forKey: "role")
        }
        if students != nil{
            aCoder.encode(students, forKey: "students")
        }
        
    }

}
