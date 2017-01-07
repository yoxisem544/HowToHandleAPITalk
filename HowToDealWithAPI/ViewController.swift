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
        let fetchUser = FetchUser()
        fetchUser
        .perform(username: "yoxisem544")
        .then(execute: { user in
            self.label.text = "Username: " + user.name
        }).catch(execute: { _ in
            self.label.text = "Request failed"
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

