//
//	Alerta.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Alerta : NSObject, NSCoding{

	var data : String!
	var hora : String!
	var mensagem : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		data = json["Data"].stringValue
		hora = json["Hora"].stringValue
		mensagem = json["Mensagem"].stringValue
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
		if hora != nil{
			dictionary["Hora"] = hora
		}
		if mensagem != nil{
			dictionary["Mensagem"] = mensagem
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "Data") as? String
         hora = aDecoder.decodeObject(forKey: "Hora") as? String
         mensagem = aDecoder.decodeObject(forKey: "Mensagem") as? String

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
		if hora != nil{
			aCoder.encode(hora, forKey: "Hora")
		}
		if mensagem != nil{
			aCoder.encode(mensagem, forKey: "Mensagem")
		}

	}

}
