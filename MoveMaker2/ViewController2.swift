//
//  ViewController2.swift
//  MoveMaker2
//
//  Created by 能美真也 on 2020/08/09.
//  Copyright © 2020年 能美真也. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var level_pass = ""
    @IBOutlet weak var Level_label: UILabel!
    @IBOutlet weak var remark: UILabel!
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一番下の説明
        remark.text = "※ ???は不定期に更新します\nリクエストはInstagramで受け付けてます"
        
        //難易度の枠線
        Level_label.layer.borderColor = UIColor.white.cgColor
        Level_label.layer.borderWidth = 2.0
        Level_label.layer.cornerRadius = 10.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //Normalをタッチしたとき
    @IBAction func Normal(_ sender: Any) {
        
        level_pass = "Normal"
        
        //画面遷移をする
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    
    //Hardをタッチしたとき
    @IBAction func Hard(_ sender: Any) {
        
        level_pass = "Hard"
        
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }

    
    //SuperHardをタッチしたとき
    @IBAction func SuperHard(_ sender: Any) {
        
        level_pass = "Super Hard"
        
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    
    //???をタッチしたとき
    @IBAction func question(_ sender: Any) {
        
        level_pass = "???"
        
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    
    
    //一つ前に戻る
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //画面遷移をする際に読み込まれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! NextViewController
        
        nextVC.level_pass2 = level_pass
        
    }
    
    
    
}
