//
//  Gallery.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import Foundation
import SwiftyJSON


class Gallery : NSObject, NSCoding{
    
    var date : String?
    var descriptionField : String?
    var id : String?
    var images : [Image]?
    var title : String?
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        date = json["date"].stringValue
        descriptionField = json["description"].stringValue
        id = json["id"].stringValue
        images = [Image]()
        let imagesArray = json["images"].arrayValue
        for imagesJson in imagesArray{
            let value = Image(fromJson: imagesJson)
            images?.append(value)
        }
        title = json["title"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if date != nil{
            dictionary["date"] = date
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if id != nil{
            dictionary["id"] = id
        }
        if images != nil{
            var dictionaryElements = [[String:Any]]()
            for imagesElement in images! {
                dictionaryElements.append(imagesElement.toDictionary())
            }
            dictionary["images"] = dictionaryElements
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        date = aDecoder.decodeObject(forKey: "date") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        images = aDecoder.decodeObject(forKey: "images") as? [Image]
        title = aDecoder.decodeObject(forKey: "title") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        
    }

}
