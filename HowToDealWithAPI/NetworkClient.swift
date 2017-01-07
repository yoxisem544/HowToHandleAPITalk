//
//  NetworkClient.swift
//  HowToDealWithAPI
//
//  Created by David on 2017/1/7.
//  Copyright © 2017年 david. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkClientType {
    func makeRequest(url: String,
                     method: HTTPMethod,
                     parameters: Parameters,
                     callback: @escaping (User?, Error?) -> Void)
}

struct NetworkClient : NetworkClientType {
    
    func makeRequest(url: String,
                     method: HTTPMethod,
                     parameters: Parameters,
                     callback: @escaping (User?, Error?) -> Void) {
        request(url,
                method: method,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: nil)
        .validate()
        .response(completionHandler: { response in
            if let data = response.data, response.error == nil {
                let json = JSON(data: data)
                let user = User(json: json)
                callback(user, nil)
            } else {
                // error
                callback(nil, response.error)
            }
        })
    }
    
}
