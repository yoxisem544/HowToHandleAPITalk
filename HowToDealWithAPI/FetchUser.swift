//
//  FetchUser.swift
//  HowToDealWithAPI
//
//  Created by David on 2017/1/7.
//  Copyright © 2017年 david. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class FetchUser : NetworkRequest {
    typealias ResponseType = User
    
    var endpoint: String { return "/post" }
    var method: HTTPMethod { return .post }
    var parameters: [String : Any]? { return ["name": "yoxisem544"] }
    
    private var username: String = ""
    func perform(username: String) -> Promise<User> {
        self.username = username
        return networkClient.makeRequest(networkRequest: self).then(execute: responseHandler)
    }
}
