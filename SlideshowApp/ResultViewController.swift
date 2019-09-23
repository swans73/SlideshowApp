//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by swans on 2019/09/19.
//  Copyright © 2019 swans. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
//2画面目のImageViewを、storyboardでこのViewControllerにアウトレット接続
    @IBOutlet weak var Expansion: UIImageView!
    //受け取るためのプロパティ
    var gazou: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        Expansion.image = self.gazou
        // Do any additional setup after loading the view.
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
