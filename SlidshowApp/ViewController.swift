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
    //引数から画像を読み込む用の関数
    func imgfunc(img: Int){
        let image = imgArray[img]
        imageView.image = UIImage(named: image)
    }
    //ラベル更新用関数
    func xxxlabel(lbl: Bool,str: String){
         nxtlbl.isEnabled = lbl
         bcklbl.isEnabled = lbl
         autolbl.setTitle(str, for: .normal)
    }
    //「再生/停止」押下後の処理
    @objc func updateTimer(_ timer:Timer){
            i += 1
        if i >= imgArray.count {
            i = 0
            imgfunc(img: i)
        }else{
            imgfunc(img: i)
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nxtlbl: UIButton!
    @IBOutlet weak var bcklbl: UIButton!
    @IBOutlet weak var autolbl: UIButton!
    
    //画像タップ時(遷移元→遷移先)
    @IBAction func tapimg(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    //storyboardを利用した画面segue(メソッド名は自由) (遷移先「戻る」→遷移元)
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    //①遷移先のビューコントローラ取得
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let exViewCon:ExpansionViewController = segue.destination as! ExpansionViewController
    //②遷移先へ送るデータをセット
            exViewCon.eximage = imageView.image
//疑問：何故E exViewCon.eximage = self.image
        
    }
    
    //「進む」imgArrayの配列数の場合分け。最大値であれば「i=0」で初期化
    @IBAction func next(_ sender: Any) {
        if i < (imgArray.count - 1) {
            i += 1
         }else{
            i = 0
        }
        imgfunc(img: i)
    }

    //「戻る」imgArrayの配列数の場合分け。最小値であれば「i=imgArray.count-1」で初期化
    @IBAction func back(_ sender: Any) {
        if i != 0{
            i -= 1
        }else{
            i = (imgArray.count - 1)
        }
        imgfunc(img: i)
    }

    //「再生/停止」の処理
    @IBAction func start_stop(_ sender: Any) {
        if self.timer == nil{
        //「進む」「戻る」無効化とラベル変更。（xxxlbl関数呼出し）
            xxxlabel(lbl: false, str: "停止")
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
        }else{
        //「進む」「戻る」有効化とラベル変更。（xxxlbl関数呼出し）
            xxxlabel(lbl: true, str: "再生")
            self.timer.invalidate()
            self.timer = nil
        }
 }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        xxxlabel(lbl: true, str: "再生")

    }
}

