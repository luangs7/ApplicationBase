//
//	User.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class User : NSObject, NSCoding{

	var agenda : [Agenda]!
	var alertas : [Alerta]!
	var nome : String!
    

    

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
    
    let userDefaultsKey = "userShared"
    static let sharedInstance = User()
    
    override init() {
            }
    
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		agenda = [Agenda]()
		let agendaArray = json["Agenda"].arrayValue
		for agendaJson in agendaArray{
			let value = Agenda(fromJson: agendaJson)
			agenda.append(value)
		}
		alertas = [Alerta]()
		let alertasArray = json["Alertas"].arrayValue
		for alertasJson in alertasArray{
			let value = Alerta(fromJson: alertasJson)
			alertas.append(value)
		}
		nome = json["Nome"].stringValue
	}

    

    
	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if agenda != nil{
			var dictionaryElements = [[String:Any]]()
			for agendaElement in agenda {
				dictionaryElements.append(agendaElement.toDictionary())
			}
			dictionary["Agenda"] = dictionaryElements
		}
		if alertas != nil{
			var dictionaryElements = [[String:Any]]()
			for alertasElement in alertas {
				dictionaryElements.append(alertasElement.toDictionary())
			}
			dictionary["Alertas"] = dictionaryElements
		}
		if nome != nil{
			dictionary["Nome"] = nome
		}
		return dictionary
	}
    
    
  
    

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         agenda = aDecoder.decodeObject(forKey: "Agenda") as? [Agenda]
         alertas = aDecoder.decodeObject(forKey: "Alertas") as? [Alerta]
         nome = aDecoder.decodeObject(forKey: "Nome") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if agenda != nil{
			aCoder.encode(agenda, forKey: "Agenda")
		}
		if alertas != nil{
			aCoder.encode(alertas, forKey: "Alertas")
		}
		if nome != nil{
			aCoder.encode(nome, forKey: "Nome")
		}

	}

}
