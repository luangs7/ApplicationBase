//
//  Alerta.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON


class Alerta : NSObject, NSCoding{
    
    var content : String?
    var id : String?
    var label : String?
    var sendedAt : String?
    var title : String?
    var unread : Bool?
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        content = json["content"].stringValue
        id = json["id"].stringValue
        label = json["label"].stringValue
        sendedAt = json["sended_at"].stringValue
        title = json["title"].stringValue
        unread = json["unread"].boolValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if content != nil{
            dictionary["content"] = content
        }
        if id != nil{
            dictionary["id"] = id
        }
        if label != nil{
            dictionary["label"] = label
        }
        if sendedAt != nil{
            dictionary["sended_at"] = sendedAt
        }
        if title != nil{
            dictionary["title"] = title
        }
        if unread != nil{
            dictionary["unread"] = unread
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        content = aDecoder.decodeObject(forKey: "content") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        label = aDecoder.decodeObject(forKey: "label") as? String
        sendedAt = aDecoder.decodeObject(forKey: "sended_at") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        unread = aDecoder.decodeObject(forKey: "unread") as? Bool
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if content != nil{
            aCoder.encode(content, forKey: "content")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if label != nil{
            aCoder.encode(label, forKey: "label")
        }
        if sendedAt != nil{
            aCoder.encode(sendedAt, forKey: "sended_at")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if unread != nil{
            aCoder.encode(unread, forKey: "unread")
        }
        
    }


}
