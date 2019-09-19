//
//  ViewController.swift
//  SlideshowApp
//
//  Created by swans on 2019/09/18.
//  Copyright © 2019 swans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBAction func Prev(_ sender: Any) {
        //表示している画像の番号を１減らす
        imageNo -= 1
        //表示している番号の画像を表示
        displayImage()
    }
    
    @IBAction func Next(_ sender: Any) {
        //表示している画像の番号を１減らす
        imageNo -= 1
        //表示している番号の画像を表示
        displayImage()
    }
    // 表示している画像の番号
    var imageNo = 0
    
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
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "fushigidane.png")
        imageView.image = image
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }


}

