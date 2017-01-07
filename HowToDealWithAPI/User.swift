//
//  User.swift
//  HowToDealWithAPI
//
//  Created by David on 2017/1/7.
//  Copyright © 2017年 david. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    let name: String
}

extension User : JSONDecodable {
    
    init?(json: JSON) {
        guard let name = json["json"]["name"].string else { return nil }
        self.name = name
    }
    
}
