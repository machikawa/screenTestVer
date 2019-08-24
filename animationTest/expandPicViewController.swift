//
//  expandPicViewController.swift
//  animationTest
//
//  Created by たうんりばー on 2019/08/24.
//  Copyright © 2019 hidemasa,machikawa. All rights reserved.
//

import UIKit

class expandPicViewController: UIViewController {

    @IBOutlet weak var expandedPicture: UIImageView!
    var receivedPicture: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        expandedPicture.frame = CGRect(x:0, y:0, width : 800, height : 800) // スライド絵のサイズをいじる
        expandedPicture.image = receivedPicture
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
