//
//  ViewController.swift
//  SlideshowApp5
//
//  Created by yonghu on 2017/09/26.
//  Copyright © 2017年 yuto.mori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var onPrevButton: UIButton!
    @IBOutlet weak var onNextButton: UIButton!
    @IBOutlet weak var onPlayStopButton: UIButton!
    /// 表示している画像の番号
    var dispImageNo = 0
    
    var imageNameSmall = ""
    
    // 画像の名前の配列
    let imageNameArray = [
        "image_1",
        "image_2",
        "image_3",
        ]

    
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "nextSegue", sender: nil)
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
        onPrevButton.isEnabled = true // ボタン有効
        onNextButton.isEnabled = true // ボタン有効
        onPlayStopButton.setTitle("再生", for: .normal) // ボタンのタイトル
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のBigImageViewControllerを取得する
        let biViewController:BigImageViewController = segue.destination as! BigImageViewController
        //画像の名前を遷移先のViewControllerのパラメータimageNameに渡す
        biViewController.imageNameBig  = imageNameArray[dispImageNo]
    }

    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    @IBAction func onPrev(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    @IBAction func onNext(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    @IBAction func onAutoPlay(_ sender: Any) {
        
        let title_onPlayStop : String = onPlayStopButton.currentTitle!
        print(title_onPlayStop)
        
        //スライドショーの再生中に「停止」ボタンを押下した時の処理
        if title_onPlayStop == "停止" {
            onPlayStopButton.setTitle("再生", for: .normal) // ボタンのタイトル
            onPrevButton.isEnabled = true // ボタン有効
            onNextButton.isEnabled = true // ボタン有効
            if self.timer != nil {
                self.timer.invalidate()   // 現在のタイマーを破棄する
                self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            }
        //スライドショーの停止中に「再生」ボタンを押下した時の処理
        }else if title_onPlayStop == "再生" {
            onPlayStopButton.setTitle("停止", for: .normal) // ボタンのタイトル
            onPrevButton.isEnabled = false // ボタン無効
            onNextButton.isEnabled = false // ボタン無効
            // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
            }
        }
    }

    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }

        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    

    /// Timerによって、一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "image_1")
        
        // Image Viewに画像を設定
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {

    }
}

