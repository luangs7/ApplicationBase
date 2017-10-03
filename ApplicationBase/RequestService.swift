//
//  RequestService.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
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



static func login(usuario: Request, completion: @escaping ( _ user: User?, _ error: NSError?) -> ()) {
    
    let headers = [
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    guard let url = URL(string: "http://sistema.grupomgt.com.br/ws/callWs.php") else {
        completion(nil,NSError(domain: "br.com.mgtoencontro", code: 404))
        return
    }
    
    let params = [
        "token": usuario.token,
        "funcao": usuario.funcao,
        "cdMatricula": usuario.cdMatricula,
        "dtNascimento": usuario.dtNascimento,
        "cdDispositivo": usuario.cdDispositivo
    ]
    
    Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding(), headers:headers)
        .responseJSON() { response in
            let status = StatusCode(rawValue:(response.response?.statusCode)!)
            
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Response: \(String(describing: json))")
            }
            
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
                let error = NSError(domain: result["erro"].string!, code: 404, userInfo: nil)
                completion(nil,error)
                break
            default:
                let error = NSError(domain: result["erro"].string!, code: 401, userInfo: nil)
                completion(nil,error)
                break
            }
    }
}


}
