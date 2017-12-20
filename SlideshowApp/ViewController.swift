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
    
    var Status = 0
    // 現在のスライドショーのステータス　0=停止、1＝再生
    var CurrentPage = 0
    // 現在のPage番号　0~2
    var timer = Timer()
    
    let image0: UIImage! = UIImage(named: "Image0")
    let image1: UIImage! = UIImage(named: "Image1")
    let image2: UIImage! = UIImage(named: "Image2")
    
    var imageArray = [UIImage]()
    
    let Saiseiimage: UIImage! = UIImage(named: "Saisei")
    let Teishiimage: UIImage! = UIImage(named: "Teishi")

    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = [image0, image1, image2]
        View1.image = imageArray[CurrentPage]
        SaiseiTeishibutton.setImage(Saiseiimage, for: UIControlState())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Susumu(_ sender: Any) {
        // ステータスが0停止のみ起動
        if Status == 0{
            switch CurrentPage {
            case 0:
                CurrentPage = 1
                View1.image = imageArray[CurrentPage]
            case 1:
                CurrentPage = 2
                View1.image = imageArray[CurrentPage]
            case 2:
                CurrentPage = 0
                View1.image = imageArray[CurrentPage]
            default:break
            }
        }
    }
    
    @IBAction func Modoru(_ sender: Any) {
        // ステータスが0停止のみ起動
        if Status == 0{
            switch CurrentPage {
            case 0:
                CurrentPage = 2
                View1.image = imageArray[CurrentPage]
            case 1:
                CurrentPage = 0
                View1.image = imageArray[CurrentPage]
            case 2:
                CurrentPage = 1
                View1.image = imageArray[CurrentPage]
            default:break
            }
        }
    }
    
    
    @IBOutlet weak var SaiseiTeishibutton: UIButton!
    
    @IBAction func SaiseiTeishi(_ sender: Any) {
        switch Status {
        case 0:
            Status = 1
            SaiseiTeishibutton.setImage(Teishiimage, for: UIControlState())
            //スライドショー開始。2秒間隔でタイマー起動
            timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (timer) in
                //タイマー起動ごとに、ページ番号追加。配列から画像を取り出して、View1に反映していく。ここはif文にしてみた。
                self.CurrentPage = self.CurrentPage + 1
                if(self.CurrentPage > 2){
                    self.CurrentPage = 0
                    self.View1.image = self.imageArray[self.CurrentPage]
                }else{
                    self.View1.image = self.imageArray[self.CurrentPage]
                }
            })
            
        case 1:
            Status = 0
            SaiseiTeishibutton.setImage(Saiseiimage, for: UIControlState())
            // スライドショー停止
            timer.invalidate()
            
        default:break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Status = 0
        SaiseiTeishibutton.setImage(Saiseiimage, for: UIControlState())
        // スライドショー停止
        timer.invalidate()
        // segueから遷移先のViewController2を取得する
        let Controller2:ViewController2 = segue.destination as! ViewController2
        // 遷移先のViewController2で宣言しているKakudaiimageに画像を代入して渡す
        Controller2.Kakudaiimage = imageArray[CurrentPage]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

