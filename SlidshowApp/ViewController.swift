//
//  ViewController.swift
//  SlidshowApp
//
//  Created by 石田悠 on 2020/04/20.
//  Copyright © 2020 yuu.ishida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num: Int = 1
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func next(_ sender: Any) {

      if num == 1 {
        imageView.image = UIImage(named: "pic2")
            num += 1
        }else if num == 2{
        imageView.image = UIImage(named: "pic3")
            num += 1
        }else{
        imageView.image = UIImage(named: "pic1")
            num = 1
        }
    }
    @IBAction func back(_ sender: Any) {

        if num == 1 {
          imageView.image = UIImage(named: "pic3")
              num = 3
          }else if num == 2{
          imageView.image = UIImage(named: "pic1")
              num -= 1
          }else{
          imageView.image = UIImage(named: "pic2")
              num -= 1
          }
    }
    @IBAction func start_stop(_ sender: Any) {
        imageView.image = UIImage.animatedImageNamed("pic1", duration: 2.0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  imageView.image = UIImage(named: "pic1")
    //    imageView.image = [UIImage imagedNamed: @"pictuer1.jpeg"]
    }


}

