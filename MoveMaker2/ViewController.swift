//
//  ViewController.swift
//  MoveMaker2
//
//  Created by 能美真也 on 2020/08/08.
//  Copyright © 2020年 能美真也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myname: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myname.text = "@2020  BRI\nInstagram  @test"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        

}

