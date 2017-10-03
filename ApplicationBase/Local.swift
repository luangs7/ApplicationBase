//
//	Local.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Local : NSObject, NSCoding{

	var descricao : String!
	var mapa : String!
	var pontoX : String!
	var pontoY : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		descricao = json["Descricao"].stringValue
		mapa = json["Mapa"].stringValue
		pontoX = json["PontoX"].stringValue
		pontoY = json["PontoY"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if descricao != nil{
			dictionary["Descricao"] = descricao
		}
		if mapa != nil{
			dictionary["Mapa"] = mapa
		}
		if pontoX != nil{
			dictionary["PontoX"] = pontoX
		}
		if pontoY != nil{
			dictionary["PontoY"] = pontoY
		}
		return dictionary
	}
    
    override init(){
        
    }
    
   

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         descricao = aDecoder.decodeObject(forKey: "Descricao") as? String
         mapa = aDecoder.decodeObject(forKey: "Mapa") as? String
         pontoX = aDecoder.decodeObject(forKey: "PontoX") as? String
         pontoY = aDecoder.decodeObject(forKey: "PontoY") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if descricao != nil{
			aCoder.encode(descricao, forKey: "Descricao")
		}
		if mapa != nil{
			aCoder.encode(mapa, forKey: "Mapa")
		}
		if pontoX != nil{
			aCoder.encode(pontoX, forKey: "PontoX")
		}
		if pontoY != nil{
			aCoder.encode(pontoY, forKey: "PontoY")
		}

	}

}
