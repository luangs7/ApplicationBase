//
//	Horario.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class Horario : NSObject, NSCoding{
    
    var atividade : String!
    var hora : String!
    var local : Local!
    var status : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        atividade = json["Atividade"].stringValue
        hora = json["Hora"].stringValue
        let localJson = json["Local"]
        if !localJson.isEmpty{
            local = Local(fromJson: localJson)
        }
        status = json["Status"].stringValue
    }
    
 
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if atividade != nil{
            dictionary["Atividade"] = atividade
        }
        if hora != nil{
            dictionary["Hora"] = hora
        }
        if local != nil{
            dictionary["Local"] = local.toDictionary()
        }
        if status != nil{
            dictionary["Status"] = status
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        atividade = aDecoder.decodeObject(forKey: "Atividade") as? String
        hora = aDecoder.decodeObject(forKey: "Hora") as? String
        local = aDecoder.decodeObject(forKey: "Local") as? Local
        status = aDecoder.decodeObject(forKey: "Status") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if atividade != nil{
            aCoder.encode(atividade, forKey: "Atividade")
        }
        if hora != nil{
            aCoder.encode(hora, forKey: "Hora")
        }
        if local != nil{
            aCoder.encode(local, forKey: "Local")
        }
        if status != nil{
            aCoder.encode(status, forKey: "Status")
        }
        
    }
    
}
