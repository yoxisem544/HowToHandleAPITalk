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
    func makeRequest<Request: NetworkRequest>(networkRequest: Request, callback: @escaping (Data?, Error?) -> Void)
}

struct NetworkClient : NetworkClientType {
    
    func makeRequest<Request : NetworkRequest>(networkRequest: Request, callback: @escaping (Data?, Error?) -> Void) {
        request(networkRequest.url,
                method: networkRequest.method,
                parameters: networkRequest.parameters,
                encoding: networkRequest.encoding,
                headers: networkRequest.headers)
        .validate()
        .response(completionHandler: { response in
            if let data = response.data, response.error == nil {
                callback(data, nil)
            } else {
                // error
                callback(nil, response.error)
            }
        })
    }
    
    func makeRequest<Response: JSONDecodable>(url: String,
                     method: HTTPMethod,
                     parameters: Parameters,
                     callback: @escaping (Response?, Error?) -> Void) {
        request(url,
                method: method,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: nil)
        .validate()
        .response(completionHandler: { response in
            if let data = response.data, response.error == nil {
                let json = JSON(data: data)
                let _response = Response(json: json)
                callback(_response, nil)
            } else {
                // error
                callback(nil, response.error)
            }
        })
    }
    
}
