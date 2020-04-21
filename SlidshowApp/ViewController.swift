//
//  ViewController.swift
//  SlidshowApp
//
//  Created by 石田悠 on 2020/04/20.
//  Copyright © 2020 yuu.ishida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 //タイマー
    var timer: Timer!
    //タイマー用の時間の変数
    var timer_sec:Float = 0

    let imgArray = ["pic1","pic2","pic3"]
    var i:Int = 0
    //引数から画像を読み込み関数
    func imgfunc(img: Int){
        let image = imgArray[img]
        imageView.image = UIImage(named: image)
    }
    
    @objc func updateTimer(_ timer:Timer){
        self.imgfunc(img: i)
        i += 1
        
        if i == imgArray.count {
             i = 0
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nxtlbl: UIButton!
    @IBOutlet weak var bcklbl: UIButton!
    @IBOutlet weak var autolbl: UIButton!
    
    //「進む」imgArrayの配列数の場合分け。最大値であれば「i=0」で初期化
    @IBAction func next(_ sender: Any) {
        if i < (imgArray.count - 1) {
            i += 1
            imgfunc(img: i)
        }else{
            i = 0
            imgfunc(img: i)
        }
    }

    //「戻る」imgArrayの配列数の場合分け。最小値であれば「i=imgArray.count-1」で初期化
    @IBAction func back(_ sender: Any) {
        if i != 0{
            i -= 1
            imgfunc(img: i)
        }else{
            i = (imgArray.count - 1)
            imgfunc(img: i)
        }
    }

    //「再生/停止」の処理
    @IBAction func start_stop(_ sender: Any) {
        if self.timer == nil{
        //「進む」「戻る」無効化
            nxtlbl.isEnabled = false
            bcklbl.isEnabled = false
            autolbl.setTitle("停止", for: .normal)
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
        }else{
        //「進む」「戻る」有効化
            nxtlbl.isEnabled = true
            bcklbl.isEnabled = true
            autolbl.setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
        }
 }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  imageView.image = UIImage(named: "pic1")
    //    imageView.image = [UIImage imagedNamed: @"pictuer1.jpeg"]

    }


}

