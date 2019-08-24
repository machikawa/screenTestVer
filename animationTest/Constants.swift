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

    // すぽっと写真
    let imageArray2 = [
        UIImage(named:"MRNUC"),
        UIImage(named:"ttw"),
        UIImage(named:"SKT"),
        UIImage(named:"EITI"),
        UIImage(named:"MGRGW")
    ]
    // 説明文
    let expArray2 = [
        "1.東京駅 - 丸の内\n千代田区丸の内　冬のゆふぐれ時に際立つ",
        "2.東京タワー\n港区芝公園4丁目　東京を見守り続けて60年",
        "3.スカイツリー\n墨田区押上1-1-2 新星",
        "4.永代橋\n江東区佐賀〜中央区新川　隅田川でほっと一息",
        "5.目黒川\n品川区北品川５丁目〜西五反田１丁目　花見ライトアップは恒例"
    ]

    // タイマー値 
    var interval:Double = 2
    
    // 初期画面から拡大画面
    var expanderSegue: String = "expander"
    
    
}
