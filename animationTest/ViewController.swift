//
//  ViewController.swift
//  animationTest
//
//  Created by たうんりばー on 2019/08/24.
//  Copyright © 2019 hidemasa,machikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screenPicture: UIImageView!
    @IBOutlet weak var saiseiBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    // 画像集
    let image1 = UIImage(named: "d001")
    let image2 = UIImage(named: "d002")
    let image3 = UIImage(named: "beer.jpg")
//    let imageSet = [image1,image2,image3]
    // ボタンのイメージ
    let startBtn = UIImage(named: "saisei.png")
    let stopBtn = UIImage(named: "stop.jpg")
    
    // ボタンの色
    let activeBtnColor = UIColor.green
    let inactiveBtnColor = UIColor.gray
    
    // 画像の数、インデクス
    var numOfImage:Int = 3
    var imageIndicator:Int = 0
    
    // デフォルトの再生状態。タイマーのインスタンス化
    var isPlay:Bool = false
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 中央のスライドの初期処理
        screenPicture.frame = CGRect(x:0, y:150, width : 400, height : 400) // スライド絵のサイズをいじる
        screenPicture.isUserInteractionEnabled = true // スライドへのタッチをゆうこうにする。
        screenPictureSetter(self.imageIndicator) // スライドの絵の設定
        // 再生ボタンの初期処理, 初期は再生状況はオフ。
        saiseiBtn.setImage(startBtn, for: .normal) // 中央の再生ボタンのイメージの設定
        self.isPlay = false          // 画面ロード時に再生ボタンの再生状況を初期化
    }
    
    // スライドの画像をセットする
    func screenPictureSetter(_ indicator: Int) {
        if (indicator % 3 == 1) {
            screenPicture.image = image2
        } else if (indicator % 3 == 2){
            screenPicture.image = image3
        } else if (indicator % 3 == 0){
            screenPicture.image = image1
        }
    }
    
    // QQ疑問！！
    // sender の Any と UIButton の違いと、そもそも Sender の定義が今ひとつようわからん。 宣言の前のアンダーバーも。。
    
    // 次へボタン押下のアクション。
    @IBAction func nextBtn(_ sender: Any) {
        changeImageByBtn(1) // 一つすすむ
    }
    
    @IBAction func prevBtn(_ sender: Any) {
        changeImageByBtn(-1) // 一つもどる
    }
    
    // 次へ戻るボタン押下時の詳細な処理。一応、進む数を１以外にすることも考えてIntで受ける。Boolでもよかったのだが。
    func changeImageByBtn(_ changeIndex: Int) {
        // 画像インジケーターの変更処理
        if changeIndex > 0 {
            if self.imageIndicator >= numOfImage - 1 { // インジケーターが画像数の最大値の時はゼロに、そうでなければ +1
                self.imageIndicator = 0
            } else {
                self.imageIndicator += 1
            }
        } else if changeIndex < 0 {
            if self.imageIndicator <= 0 { // インジケーターが０の時は画像数の最大値に、そうでなければマイナス１に
                self.imageIndicator = numOfImage - 1
            } else {
                self.imageIndicator -= 1
            }
        }
        // スクリーンイメージの設定
        screenPictureSetter(self.imageIndicator)
    }
}
// for commit

