//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 赤穂亮太郎 on 2017/12/18.
//  Copyright © 2017年 ryoutarou.akou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var View1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 【1】 画像データをインスタンス化
        let image1: UIImage! = UIImage(named: "Image1")
        let image2: UIImage! = UIImage(named: "Image2")
        let image3: UIImage! = UIImage(named: "Image3")
        // 【2】 コマ送りに使う画像データの配列をセット
        View1.animationImages = [image1, image2, image3]
        // 【3】 コマ送りの間隔を設定
        View1.animationDuration = 1
        // 【4】 コマ送りのアニメーションを開始
        View1.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Susumu(_ sender: Any) {
    }
    
    @IBAction func Modoru(_ sender: Any) {
    }
    
}

