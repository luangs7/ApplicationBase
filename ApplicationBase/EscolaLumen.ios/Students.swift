//
//  Students.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit
import SwiftyJSON

class Students: NSObject, NSCoding {
    
    var active : Bool?
    var birthday : String?
    var email : String?
    var gender : String?
    var grade : Grade?
    var id : String?
    var mobile : String?
    var name : String?
    var phone : String?
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        active = json["active"].boolValue
        birthday = json["birthday"].stringValue
        email = json["email"].stringValue
        gender = json["gender"].stringValue
        let gradeJson = json["grade"]
        if !gradeJson.isEmpty{
            grade = Grade(fromJson: gradeJson)
        }
        id = json["id"].stringValue
        mobile = json["mobile"].stringValue
        name = json["name"].stringValue
        phone = json["phone"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if active != nil{
            dictionary["active"] = active
        }
        if birthday != nil{
            dictionary["birthday"] = birthday
        }
        if email != nil{
            dictionary["email"] = email
        }
        if gender != nil{
            dictionary["gender"] = gender
        }
        if grade != nil{
            dictionary["grade"] = grade?.toDictionary()
        }
        if id != nil{
            dictionary["id"] = id
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if name != nil{
            dictionary["name"] = name
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        active = aDecoder.decodeObject(forKey: "active") as? Bool
        birthday = aDecoder.decodeObject(forKey: "birthday") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        gender = aDecoder.decodeObject(forKey: "gender") as? String
        grade = aDecoder.decodeObject(forKey: "grade") as? Grade
        id = aDecoder.decodeObject(forKey: "id") as? String
        mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if active != nil{
            aCoder.encode(active, forKey: "active")
        }
        if birthday != nil{
            aCoder.encode(birthday, forKey: "birthday")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if gender != nil{
            aCoder.encode(gender, forKey: "gender")
        }
        if grade != nil{
            aCoder.encode(grade, forKey: "grade")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        
    }

}
