//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 赤穂亮太郎 on 2017/12/18.
//  Copyright © 2017年 ryoutarou.akou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var CurrentPage = 1
    // 現在のPage番号　1~3
    var Status = 1
    // 現在のコマ送りステータス　1=停止、2＝再生
    
    @IBOutlet weak var View1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CurrentPage = 1
        View1.image = #imageLiteral(resourceName: "Image1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Susumu(_ sender: Any) {
        // コマ送りスタータスが１停止のみ起動
        if Status == 1{
            switch CurrentPage {
            case 1:
                CurrentPage = 2
                View1.image = #imageLiteral(resourceName: "Image2")
            case 2:
                CurrentPage = 3
                View1.image = #imageLiteral(resourceName: "Image3")
            case 3:
                CurrentPage = 1
                View1.image = #imageLiteral(resourceName: "Image1")
            default:break
            }
        }
    }
    
    @IBAction func Modoru(_ sender: Any) {
        // コマ送りスタータスが１停止のみ起動
        if Status == 1{
            switch CurrentPage {
            case 1:
                CurrentPage = 3
                View1.image = #imageLiteral(resourceName: "Image3")
            case 2:
                CurrentPage = 1
                View1.image = #imageLiteral(resourceName: "Image1")
            case 3:
                CurrentPage = 2
                View1.image = #imageLiteral(resourceName: "Image2")
            default:break
            }
        }
    }
    
    @IBAction func SaiseiTeishi(_ sender: Any) {
        switch Status {
        case 1:
            Status = 2
            // 【1】 画像データをインスタンス化
            let image1: UIImage! = UIImage(named: "Image1")
            let image2: UIImage! = UIImage(named: "Image2")
            let image3: UIImage! = UIImage(named: "Image3")
            // 【2】 コマ送りに使う画像データの配列をセット
            View1.animationImages = [image1, image2, image3]
            // 【3】 コマ送りの間隔を設定
            View1.animationDuration = 2.0
            // 【4】 コマ送りのアニメーションを開始
            View1.startAnimating()
        case 2:
            Status = 1
            // コマ送りのアニメーションを停止
            View1.stopAnimating()
        default:break
        }
    }
    
}

