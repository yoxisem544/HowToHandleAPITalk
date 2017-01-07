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
        NetworkClient.makeRequest(url: url,
                                  method: .post,
                                  parameters: params,
        callback: ({ (json, error) in
            if let json = json, error == nil {
                self.label.text = "Username: " + json["json"]["name"].stringValue
            } else {
                // error
                self.label.text = "Request failed"
            }
        }))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

