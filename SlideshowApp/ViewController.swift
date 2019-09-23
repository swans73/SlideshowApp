//
//  ViewController.swift
//  SlideshowApp
//
//  Created by swans on 2019/09/18.
//  Copyright © 2019 swans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //タイマー
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // 表示している画像の番号
    var imageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "fushigidane.png")
        Image.image = image
        // Do any additional setup after loading the view.
    }
    //selector: #selector(updatetimer(_:))で指定された関数
    //timerInterval: 0.1, repeats: trueで指定された通り、2.0秒毎に呼び出される
    //更新用関数
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 2.0
        //画像を表示
        //表示している画像の番号を１増やす
        imageNo += 1
        //表示している番号の画像を表示
        displayImage()
    }
    //再生/一時停止ボタン

    @IBOutlet weak var PrevButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var startPause: UIButton!
    @IBAction func startTimer(_ sender: Any) {
        //再生ボタンが押されたら、タイマーの作成、始動
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            startPause.setTitle("一時停止", for: .normal)
            //戻るボタンと進むボタンをタップ不可にする
            PrevButton.isEnabled = false
            NextButton.isEnabled = false
        } else {
            startPause.setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
            //戻るボタンと進むボタンをタップ可にする
            PrevButton.isEnabled = true
            NextButton.isEnabled = true
        }
    }
    //画像をタップしたら処理を実行
    @IBAction func tapAction(_ sender: Any) {
        self.timer.invalidate()
    }
    //他の画面からsegueを使って戻ってきたときに呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    //UIImageViewをアウトレット接続
    @IBOutlet weak var Image: UIImageView!
    //戻るボタン
    @IBAction func Prev(_ sender: Any) {
        //表示している画像の番号を１減らす
        imageNo -= 1
        //表示している番号の画像を表示
        displayImage()
    }
    //進むボタン
    @IBAction func Next(_ sender: Any) {
        //表示している画像の番号を１増やす
        imageNo += 1
        //表示している番号の画像を表示
        displayImage()
    }
   
    
    
    //表示している番号の画像を表示
    func displayImage(){
        //画像の名前の配列
        let imageName = [
        "fushigidane.png",
        "hitokage.png",
        "zenigame.png",
        ]
        //画像の番号の範囲チェック
        if imageNo < 0 {
            imageNo = 2
        }
        if imageNo > 2 {
            imageNo = 0
        }
        //表示している番号から名前を取り出す
        let name = imageName[imageNo]
        //画像を読み込む
        let image = UIImage(named: name)
        //ImageViewに読み込んだ画像をセット
        Image.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言している値を代入して渡す
        resultViewController.gazou = Image.image
    }
    
    
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }


}

