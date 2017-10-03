	//
//  RequestService.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class RequestService: NSObject {
  
    
    enum StatusCode: Int {
        case success = 200
        case unauthorized = 401
        case badRequest = 400
        case notFound = 404
        case notAuthorized = 422
        case error = 500
    }
    

    static func check(usuario: User, completion: @escaping ( _ error: NSError?) -> ()) {
        
        let endpoint = String(format: "%@/users/check", Constraint.url)

        
        guard let url = URL(string: endpoint) else {
            completion(NSError(domain: "br.com.escolalumen", code: 404))
            return
        }
        
        let params =  usuario.toDictionary()
        
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .responseJSON() { response in
                let status = StatusCode(rawValue:(response.response?.statusCode)!)
                
                guard let value = response.result.value, response.result.isSuccess else {
                    if let _ = response.result.error {
                        let error = NSError(domain: "Problema de conexão", code: status!.rawValue, userInfo: nil)
                        completion(error)
                    }
                    return
                }
                
                let result = JSON(value)
                
            
                switch status! {
                case .success:
                    completion(nil)
                    break
                case .notFound:
                    let error = NSError(domain: result["message"].string!, code: 404, userInfo: nil)
                    completion(error)
                    break
                default:
                    break
                }
        }
    }
    
    
    static func login(usuario: User, completion: @escaping ( _ user: User?, _ error: NSError?) -> ()) {
        
        let endpoint = String(format: "%@/users/check", Constraint.url)
        
        
        guard let url = URL(string: endpoint) else {
            completion(nil,NSError(domain: "br.com.escolalumen", code: 404))
            return
        }
        
        let params =  usuario.toDictionary()
        
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .responseJSON() { response in
                let status = StatusCode(rawValue:(response.response?.statusCode)!)
                
                guard let value = response.result.value, response.result.isSuccess else {
                    if let _ = response.result.error {
                        let error = NSError(domain: "Problema de conexão", code: status!.rawValue, userInfo: nil)
                        completion(nil,error)
                    }
                    return
                }
                
                let result = JSON(value)
                
                
                switch status! {
                case .success:
                    let user = User(fromJson: result)
                    completion(user, nil)
                    break
                case .notFound:
                    let error = NSError(domain: result["message"].string!, code: 404, userInfo: nil)
                    completion(nil,error)
                    break
                default:
                    break
                }
        }
    }
    
    static func signup(usuario: User, completion: @escaping ( _ user: User?, _ error: NSError?) -> ()) {
        
        let endpoint = String(format: "%@/users", Constraint.url)
        
        
        guard let url = URL(string: endpoint) else {
            completion(nil,NSError(domain: "br.com.escolalumen", code: 404))
            return
        }
        
        let params =  Utils.toJsonServer(name: "user",jsonToSend: usuario.toDictionary())
        
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .responseJSON() { response in
                let status = StatusCode(rawValue:(response.response?.statusCode)!)
                
                guard let value = response.result.value, response.result.isSuccess else {
                    if let _ = response.result.error {
                        let error = NSError(domain: "Problema de conexão", code: status!.rawValue, userInfo: nil)
                        completion(nil,error)
                    }
                    return
                }
                
                let result = JSON(value)
                
                
                switch status! {
                case .success:
                    let user = User(fromJson: result)
                    completion(user, nil)
                    break
                case .notFound:
                    let error = NSError(domain: result["message"].string!, code: 404, userInfo: nil)
                    completion(nil,error)
                    break
                default:
                    let error = NSError(domain: result["message"].string!, code: 404, userInfo: nil)
                    completion(nil,error)
                    break
                }
        }
    }




}
