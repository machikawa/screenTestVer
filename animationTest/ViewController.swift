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
    
    // 画像集 // Refuctor1 8/24-1 画像を配列に refactor-3 8/24
    let imageArray = Constants.init().imageArray2
    let expArray = Constants.init().expArray2
    
    // 画像インデクス
    var imageIndicator:Int = 0
    // デフォルトの再生状態。タイマーのインスタンス化
    var isPlay:Bool = false
    var timer:Timer!

////////////////// VIEW ACTIONS //////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // 中央のスライドの初期処理 refactor-3 8/22 Frameによる座標等指定の禁止と、saiseiBtn のボタンタイプ変更
        screenPicture.isUserInteractionEnabled = true // スライドへのタッチをゆうこうにする。
        screenPictureSetter(self.imageIndicator) // スライドの絵の設定

        // 再生ボタンの初期処理, 初期は再生状況はオフ。
        saiseiBtn.setImage(Constants.init().startBtn, for: .normal) // 中央の再生ボタンのイメージの設定
        self.isPlay = false          // 画面ロード時に再生ボタンの再生状況を初期化
    }
////////////////// BUTTON ACTIONS //////////////////
    // ボタン押下時ののアクション。
    @IBAction func nextBtn(_ sender: Any) {
        changePicture(1) // 一つすすむ
    }
    @IBAction func prevBtn(_ sender: Any) {
        changePicture(-1) // 一つもどる
    }
    @IBAction func saiseiBtn(_ sender: Any) {
        if self.isPlay  {
            pushSaiseiButton(Constants.init().startBtn, false, Constants.init().activeBtnColor)
        } else if !self.isPlay {
            pushSaiseiButton(Constants.init().stopBtn, true, Constants.init().inactiveBtnColor)
        }
    }
    
    @IBAction func onTappedImage(_ sender: Any) {
        performSegue(withIdentifier: "expander", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "expander" {
            let epVC = segue.destination as! expandPicViewController
            epVC.receivedPicture = imageArray[(self.imageIndicator)]
            epVC.receivedExplaination = expArray[(self.imageIndicator)]
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
////////////////// FUNCTIONS //////////////////
    // スライドの画像をセットする // Refuctor1 8/24-1 配列を使ったらとてもがぞう変更が楽になった
    func screenPictureSetter(_ indicator: Int) {
        screenPicture.image = imageArray[indicator % imageArray.count]
    }

    // 次へ戻るボタン押下時の詳細な処理。一応、進む数を１以外にすることも考えてIntで受ける。Boolでもよかったのだが。
    // Refuctor1 8/24-1 imageIndicator の受け方とかさん方法がや誤っていた。
    func changePicture(_ changeIndex: Int) {
        // 画像インジケーターの変更処理　// Refuctor1 8/24-1 配列を使ってもう少し
        if changeIndex > 0 && self.imageIndicator >= self.imageArray.count - 1 {
            self.imageIndicator = 0
        } else if changeIndex < 0 && self.imageIndicator == 0 {
            self.imageIndicator = imageArray.count - 1
        } else {
            self.imageIndicator += changeIndex
        }
        screenPictureSetter(self.imageIndicator)         // スクリーンイメージの設定
    }

    // 再生ボタン押下時の処理 // Refuctor1 8/24-1 引数を減らした。なぜか changePlaystete が let 扱いでトグルが使えない。
    // Refactor 2 8/24-2 タイマー活動もこちらに記述
    func pushSaiseiButton(_ buttonimage : UIImage!,_ changedPlayState: Bool, _ buttonColor: UIColor){
        self.saiseiBtn.setImage(buttonimage, for: .normal)
        self.isPlay = changedPlayState
        self.nextBtn.setTitleColor(buttonColor, for: .normal)
        self.prevBtn.setTitleColor(buttonColor, for: .normal)
        self.nextBtn.isEnabled = !changedPlayState
        self.prevBtn.isEnabled = !changedPlayState
        
        if isPlay {
            // 自動再生を開始する
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(Constants.init().interval), target: self, selector: #selector(timerUpdate(_:)), userInfo: nil, repeats: true)
        } else {
            // 自動再生をやめる
            self.timer.invalidate()
            self.timer = nil
        }
    }
    // タイマーのアップデート処理
    @objc func timerUpdate(_ timer: Timer) {
        changePicture(1)
    }
    
}
