//
//  Grade.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit
import SwiftyJSON

class Grade: NSObject, NSCoding{
    
    var course : String!
    var id : Int!
    var level : String!
    var name : String!
    var period : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        course = json["course"].stringValue
        id = json["id"].intValue
        level = json["level"].stringValue
        name = json["name"].stringValue
        period = json["period"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if course != nil{
            dictionary["course"] = course
        }
        if id != nil{
            dictionary["id"] = id
        }
        if level != nil{
            dictionary["level"] = level
        }
        if name != nil{
            dictionary["name"] = name
        }
        if period != nil{
            dictionary["period"] = period
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        course = aDecoder.decodeObject(forKey: "course") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        level = aDecoder.decodeObject(forKey: "level") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        period = aDecoder.decodeObject(forKey: "period") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if course != nil{
            aCoder.encode(course, forKey: "course")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if level != nil{
            aCoder.encode(level, forKey: "level")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if period != nil{
            aCoder.encode(period, forKey: "period")
        }
        
    }
}
