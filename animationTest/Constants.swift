//
//  Constants.swift
//  animationTest
//
//  Created by たうんりばー on 2019/08/24.
//  Copyright © 2019 hidemasa,machikawa. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    // 画像集 // Refuctor1 8/24-1 画像を配列に
    let imageArray2 = [UIImage(named: "d001"), UIImage(named: "d002"), UIImage(named: "beer.jpg")]
    // ボタンのイメージ
    let startBtn2 = UIImage(named: "saisei.png")
    let stopBtn2 = UIImage(named: "stop.jpg")
    
    // ボタンの色
    let activeBtnColor2 = UIColor.blue
    let inactiveBtnColor2 = UIColor.gray
    
    // タイマー値 // Refuctor 2 8/24-1 インターバルを double に
    var interval:Double = 0.5
}
