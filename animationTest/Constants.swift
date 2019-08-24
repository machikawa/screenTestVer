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
    // ボタンのイメージ
    let startBtn = UIImage(named: "saisei")
    let stopBtn = UIImage(named: "stop")
    // ボタンの色
    let activeBtnColor = UIColor.blue
    let inactiveBtnColor = UIColor.gray
    
    // タイマー値 
    var interval:Double = 2
    
    // 初期画面から拡大画面
    var expanderSegue: String = "expander"
}
