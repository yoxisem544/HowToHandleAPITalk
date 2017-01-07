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
        
        // make a request
        let url = "http://httpbin.org/post"
        let params: [String : Any] = ["name": "yoxisem544"]
        
        let networkClient = NetworkClient()
        networkClient.makeRequest(url: url, method: HTTPMethod.post, parameters: params, callback: { (user: User?, errro: Error?) in
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

