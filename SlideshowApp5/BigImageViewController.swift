//
//  BigImageViewController.swift
//  SlideshowApp5
//
//  Created by yonghu on 2017/09/28.
//  Copyright © 2017年 yuto.mori. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {


    @IBOutlet weak var imageView: UIImageView!
    // 受け取るためのプロパティ（変数）を宣言しておく
    var imageNameBig:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: imageNameBig)
        // Do any additional setup after loading the view.
        // Image Viewに画像を設定
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
