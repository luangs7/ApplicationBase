//
//  JsonSerializer.swift
//  EscolaLumen.ios
//
//  Created by Luan Silva on 14/09/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

extension JSONSerializable {
    func toJSON() -> String? {
        let representation = JSONRepresentation
        
        guard NSJSONSerialization.isValidJSONObject(representation) else {
            return nil
        }
        
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(representation, options: [])
            return String(data: data, encoding: NSUTF8StringEncoding)
        } catch {
            return nil
        }
    }
}
