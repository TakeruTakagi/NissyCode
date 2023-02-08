//
//  ViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/10.
//

import UIKit

final class ViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().shadowImage = UIImage()
        delegate = self
    }
}

extension ViewController: UITabBarControllerDelegate {
    // shouldSelectでアニメーションさせる。
    // didSelectでは、アニメーションさせるには手遅れ
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        animateTabItem(tabBarController, shouldSelect: viewController)
        return true
    }

    // アニメーションさせる
    private func animateTabItem(_ tabBarController: UITabBarController,
                                shouldSelect viewController: UIViewController) {
        // 変更前後のindexを取得
        let selectedIndex = tabBarController.selectedIndex
        let nextIndex: Int = (tabBarController.viewControllers?.firstIndex(of: viewController))!

        // TabBarのButtonを取得する
        // TabBarのsubviewsにはUITabBarButtonがいるものの、
        // このクラスは公開されていないため、UIControlにキャストして使う、UIViewでも良い
        let tabBarButtons = tabBarController.tabBar.subviews.compactMap { $0 as? UIControl }
        let currentButton = tabBarButtons[selectedIndex]
        let nextButton = tabBarButtons[nextIndex]

        // ボタン画像、ノーマル画像、選択済み画像のレイヤーを取得する
        guard let (cImage, cNormal, cSelected) =
                createImageLayer(tabBarController,
                                 index: selectedIndex,
                                 button: currentButton),
              let (nImage, nNormal, nSelected) =
                createImageLayer(tabBarController,
                                 index: nextIndex,
                                 button: nextButton)
        else {
            return
        }

        // CAアニメーションのインスタンスを生成
        let duration = 0.15
        let fadeout = CABasicAnimation(keyPath: "opacity")
        fadeout.fromValue = 1.0
        fadeout.toValue = 0.0
        fadeout.duration = duration
        let fadein = CABasicAnimation(keyPath: "opacity")
        fadein.fromValue = 0.0
        fadein.toValue = 1.0
        fadein.duration = duration

        // ボタン画像のレイヤーを、一旦透明にする
        cImage.opacity = 0.0
        nImage.opacity = 0.0

        // ディゾルブアニメーション定義開始
        CATransaction.begin()

        // アニメーション終了後の処理を登録
        CATransaction.setCompletionBlock {
            // ボタン画像を不透明に戻す
            cImage.opacity = 1.0
            nImage.opacity = 1.0

            // アニメーションで使ったレイヤーを削除
            cNormal.removeFromSuperlayer()
            cSelected.removeFromSuperlayer()
            nNormal.removeFromSuperlayer()
            nSelected.removeFromSuperlayer()
        }

        // アニメーションを登録
        cNormal.add(fadein, forKey: nil)
        cSelected.add(fadeout, forKey: nil)
        nNormal.add(fadeout, forKey: nil)
        nSelected.add(fadein, forKey: nil)

        // アニメーション後の値を設定
        cNormal.opacity = 1.0
        cSelected.opacity = 0.0
        nNormal.opacity = 0.0
        nSelected.opacity = 1.0

        // アニメーションの実行
        CATransaction.commit()
    }

    // TabBarButtonの画像レイヤー、
    // Normal状態の画像レイヤー、
    // Selected状態の画像レイヤーを生成する
    private func createImageLayer(_ tabBarController: UITabBarController,
                                  index: Int,
                                  button: UIControl) -> (CALayer, CALayer, CALayer)? {
        // buttonから画像レイヤーを取得する
        // UI仕様が変わったら失敗するので、諸刃の剣ではある
        guard let tabBarItem = tabBarController.viewControllers?[index].tabBarItem,
              let imageLayer = button.layer.sublayers?.first
        else {
            return nil
        }

        // Normal stateの画像レイヤーを作る
        let normalImageLayer = CALayer()
        normalImageLayer.frame = imageLayer.frame
        normalImageLayer.contents = tabBarItem.image?.cgImage
        button.layer.insertSublayer(normalImageLayer, below: imageLayer)

        // Selected stateの画像レイヤーを作る
        let selectedImageLayer = CALayer()
        selectedImageLayer.frame = imageLayer.frame
        selectedImageLayer.contents = tabBarItem.selectedImage?.cgImage
        button.layer.insertSublayer(selectedImageLayer, below: imageLayer)

        return (imageLayer, normalImageLayer, selectedImageLayer)
    }
}
