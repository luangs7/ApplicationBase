//
//	Agenda.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Agenda : NSObject, NSCoding{

	var data : String!
	var horarios : [Horario]!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		data = json["Data"].stringValue
		horarios = [Horario]()
		let horariosArray = json["Horarios"].arrayValue
		for horariosJson in horariosArray{
			let value = Horario(fromJson: horariosJson)
			horarios.append(value)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if data != nil{
			dictionary["Data"] = data
		}
		if horarios != nil{
			var dictionaryElements = [[String:Any]]()
			for horariosElement in horarios {
				dictionaryElements.append(horariosElement.toDictionary())
			}
			dictionary["Horarios"] = dictionaryElements
		}
		return dictionary
	}

    override init() {
        
    }
    
       
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "Data") as? String
         horarios = aDecoder.decodeObject(forKey: "Horarios") as? [Horario]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "Data")
		}
		if horarios != nil{
			aCoder.encode(horarios, forKey: "Horarios")
		}

	}

}
