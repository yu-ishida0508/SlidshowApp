//
//  ViewController.swift
//  SlidshowApp
//
//  Created by 石田悠 on 2020/04/20.
//  Copyright © 2020 yuu.ishida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
/*   var num: Int = 1
      
 //タイマー
    var timer: Timer!
    //タイマー用の時間の変数
    var timer_sec:Float = 0
    
    @objc func updateTimer(_ timer:Timer){
        self.timer_sec = 2.0
        self.imageView.image =
        }
*/
    let imgArray = ["pic1","pic2","pic3"]
    var i:Int = 0
    func imgfunc(img: Int){
        let image = imgArray[img]
        imageView.image = UIImage(named: image)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func next(_ sender: Any) {

        if i <= (imgArray.count - 1){
            imgfunc(img: i)
             i += 1
        }else{
            i = 0
            imgfunc(img: i)
            i += 1
        }
    }
    @IBAction func back(_ sender: Any) {
        if i != 0{
            i -= 1
            imgfunc(img: i)
        }else{
            i = (imgArray.count - 1)
            imgfunc(img: i)
               }
    }

    @IBAction func start_stop(_ sender: Any) {
     //   imageView.image = UIImage.animatedImageNamed("pic1", duration: 2.0)
/*        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
*/
 }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  imageView.image = UIImage(named: "pic1")
    //    imageView.image = [UIImage imagedNamed: @"pictuer1.jpeg"]

    }


}

