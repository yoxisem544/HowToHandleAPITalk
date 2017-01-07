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
import PromiseKit

protocol NetworkClientType {
    func makeRequest<Request: NetworkRequest>(networkRequest: Request) -> Promise<Data>
}

struct NetworkClient : NetworkClientType {
    
    func makeRequest<Request : NetworkRequest>(networkRequest: Request) -> Promise<Data> {
        
        let (promise, fulfill, reject) = Promise<Data>.pending()
        
        request(networkRequest.url,
                method: networkRequest.method,
                parameters: networkRequest.parameters,
                encoding: networkRequest.encoding,
                headers: networkRequest.headers)
        .validate()
        .response(completionHandler: { response in
            if let data = response.data, response.error == nil {
                fulfill(data)
            } else if let error = response.error {
                // error
                reject(error)
            }
        })
        
        return promise
    }
    
}
