//
//  Tweet.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/4/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import Foundation

struct Tweet : CustomStringConvertible {
    let name : String
    let text : String
    var description: String {
        return "(\(name), \(text))"
    }
    
    
}
