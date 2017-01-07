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
    func fetchUsername(callback: @escaping (_ name: String?, _ error: Error?) -> Void)
    func makeRequest(url: String,
                     method: HTTPMethod,
                     parameters: Parameters,
                     callback: @escaping (_ json: JSON?, _ error: Error?) -> Void)
}

struct NetworkClient : NetworkClientType {
    
    func fetchUsername(callback: @escaping (String?, Error?) -> Void) {
        let url = "http://httpbin.org/post"
        let params = ["name": "yoxisem544"]
        
        makeRequest(url: url,
                    method: .post,
                    parameters: params,
        callback: { json, error in
            if let json = json, error == nil {
                callback(json["json"]["name"].string, nil)
            } else {
                // error
                callback(nil, error)
            }
        })
    }
    
    func makeRequest(url: String,
                            method: HTTPMethod,
                            parameters: Parameters,
                            callback: @escaping (_ json: JSON?, _ error: Error?) -> Void) {
        request(url,
                method: method,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: nil)
        .validate()
        .response(completionHandler: { response in
            if let data = response.data, response.error == nil {
                let json = JSON(data: data)
                callback(json, nil)
            } else {
                // error
                callback(nil, response.error)
            }
        })
    }
    
}
