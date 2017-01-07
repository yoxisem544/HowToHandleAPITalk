//
//  FetchUser.swift
//  HowToDealWithAPI
//
//  Created by David on 2017/1/7.
//  Copyright © 2017年 david. All rights reserved.
//

import Foundation
import Alamofire

class FetchUser : NetworkRequest {
    typealias ResponseType = User
    
    var endpoint: String { return "/post" }
    var method: HTTPMethod { return .post }
    var parameters: [String : Any]? { return ["name": "yoxisem544"] }
    
    private var username: String = ""
    func perform(username: String, callback: @escaping (User?, Error?) -> Void) {
        self.username = username
        let parsedCallback = { (data: Data?, error: Error?) in
            let response = data.flatMap(self.responseHandler)
            callback(response, error)
        }
        networkClient.makeRequest(networkRequest: self, callback: parsedCallback)
    }
}
