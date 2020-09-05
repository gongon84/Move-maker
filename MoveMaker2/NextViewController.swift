//
//  NextViewController.swift
//  MoveMaker2
//
//  Created by 能美真也 on 2020/08/08.
//  Copyright © 2020年 能美真也. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var Level2: UILabel!
    
    var timer = Timer()
    var count = Int()
    var count2 = Int()
    var array1 = ["１歩", "２歩", "３歩", "６歩", "チェアー", "三点倒立", "CC", "マカコ", "スワイプス", "はね起き", "エアーベイビー", "NY", "ワーム", "ドンキー", "トラックス", "LA", "後転倒立", "ウインド", "スワイプス", "トーマス", "タートル"]
    var array2 = ["ノーマル", "片手で", "頭をついて", "肘をついて", "移動しながら", "ジャンプして", "片手を腰に", "手をクロスして", "足抜き", "足or手首タッチ", "バタバタ"]
    var array_hard = ["ウインド", "スワイプス", "トーマス", "タートル"]
    var array_superhard = ["ジャックハンマー", "エアー", "ドリル", "ヘッドスピン", "1990", "2000", "ベビーウインド"]
    var array_question = ["アプリ","Webサービス","コンビニ","銀行・証券","教育","電気・ガス","ホテル・旅行","不動産","自動車"]
    var array3 = ["20代","サラリーマン","富裕層","女性","男性","老人","子供"]
    var level_pass2 = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //前の画面のレベルを表示
        Level2.text = level_pass2
        
        count = 0
        count2 = 0
        
        //枠線をつける
        borderWidth()
        
        //stopボタンを押せなくする
        stopButton.isEnabled = false
        stopButton.setTitleColor(UIColor.gray, for: .normal)
        stopButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //枠線をつける
    func borderWidth(){
        Level2.layer.borderColor = UIColor.white.cgColor
        Level2.layer.borderWidth = 2.0
        Level2.layer.cornerRadius = 10.0
        label1.layer.borderWidth = 1.0
        label2.layer.borderWidth = 1.0
        label3.layer.borderWidth = 1.0
        label4.layer.borderWidth = 1.0
        
        //ボタン
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.layer.borderWidth = 2.0
        startButton.layer.cornerRadius = 50.0
        stopButton.layer.borderColor = UIColor.white.cgColor
        stopButton.layer.borderWidth = 2.0
        stopButton.layer.cornerRadius = 50.0
        
    }
    
    
    //タイマーを回す
    func startTimer(){
        
        //0.2秒ごとにメソッドを呼び出す
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    
    @objc func timerUpdate(){
        
        //難易度がNormalのとき
        if level_pass2 == "Normal"{
            //ランダムな数を設定
            count = Int(arc4random_uniform(UInt32(array1.count)))
            count2 = Int(arc4random_uniform(UInt32(array2.count)))
            
            label1.text = array1[count]
            label2.text = array2[count2]
            
            //数リセット
            count = Int(arc4random_uniform(UInt32(array1.count)))
            count2 = Int(arc4random_uniform(UInt32(array2.count)))
            
            label3.text = array2[count2]
            label4.text = array1[count]
        }
        
        
        //Hardのとき
        if level_pass2 == "Hard"{
            count = Int(arc4random_uniform(UInt32(array_hard.count)))
            count2 = Int(arc4random_uniform(UInt32(array2.count)))
            
            label1.text = array_hard[count]
            label2.text = array2[count2]
            
            //数リセット
            count = Int(arc4random_uniform(UInt32(array_hard.count)))
            count2 = Int(arc4random_uniform(UInt32(array2.count)))
            
            label3.text = array2[count2]
            label4.text = array_hard[count]
        }
        
        //Super Hardのとき
        if level_pass2 == "Super Hard"{
            count = Int(arc4random_uniform(UInt32(array_superhard.count)))
            count2 = Int(arc4random_uniform(UInt32(array2.count)))
            
            label1.text = array_superhard[count]
            label2.text = array2[count2]
            
            //数リセット
            count = Int(arc4random_uniform(UInt32(array_superhard.count)))
            count2 = Int(arc4random_uniform(UInt32(array2.count)))
            
            label3.text = array2[count2]
            label4.text = array_superhard[count]
        }
        
        //???のとき
        if level_pass2 == "???"{
            count = Int(arc4random_uniform(UInt32(array_question.count)))
            count2 = Int(arc4random_uniform(UInt32(array3.count)))
            
            label1.text = array_question[count]
            label2.text = array3[count2]
            
            //数リセット
            count = Int(arc4random_uniform(UInt32(array_question.count)))
            count2 = Int(arc4random_uniform(UInt32(array3.count)))
            
            label3.text = array3[count2]
            label4.text = array_question[count]
        }
        
    }
    
    
    
    //startを押したとき
    @IBAction func start(_ sender: Any) {
        
        //タイマーが起動する
        startTimer()
        
        //startボタンを押せなくする ＆　stopボタンを推せるようにする
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        //ボタンの文字が薄くなる
        startButton.setTitleColor(UIColor.gray, for: .normal)
        startButton.layer.borderColor = UIColor.gray.cgColor
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
    //stopを押したとき
    @IBAction func stop(_ sender: Any) {
        
        //startボタンを押せるようにする ＆　stopボタンを押せなくする
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        //ボタンの文字が薄くなる
        stopButton.setTitleColor(UIColor.gray, for: .normal)
        stopButton.layer.borderColor = UIColor.gray.cgColor
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.layer.borderColor = UIColor.white.cgColor
        
        //タイマーを止める
        timer.invalidate()
    }
    
    
    //一つ前に戻る
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

