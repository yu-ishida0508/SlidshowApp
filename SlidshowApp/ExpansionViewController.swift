//
//  ExpansionViewController.swift
//  SlidshowApp
//
//  Created by 石田悠 on 2020/04/21.
//  Copyright © 2020 yuu.ishida. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    @IBOutlet weak var expVC: UIImageView!
      
    //遷移元からの受取り用データ格納先の指定
      var eximage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        //受取り用データからイメージ画像の挿入
        expVC.image = self.eximage
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
