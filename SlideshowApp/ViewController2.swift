//
//  ViewController2.swift
//  SlideshowApp
//
//  Created by 赤穂亮太郎 on 2017/12/20.
//  Copyright © 2017年 ryoutarou.akou. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var View2: UIImageView!
    var Kakudaiimage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        View2.image = self.Kakudaiimage
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
