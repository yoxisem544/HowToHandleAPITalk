//
//  ViewController.swift
//  HowToDealWithAPI
//
//  Created by David on 2017/1/7.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "http://httpbin.org/post"
        let params = ["name": "yoxisem544"]
        
        // make a request        
        request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
        .validate()
        .response { (response) in
            if let data = response.data, response.error == nil {
                let json = JSON(data: data)
                self.label.text = "Username: " + json["json"]["name"].stringValue
            } else {
                // error
                self.label.text = "Request failed"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

