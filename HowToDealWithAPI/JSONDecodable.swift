//
//  JSONDecodable.swift
//  HowToDealWithAPI
//
//  Created by David on 2017/1/7.
//  Copyright © 2017年 david. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONDecodable {
    init?(json: JSON)
}
