//
//  FormalTableViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import Foundation
import UIKit
import RealmSwift

class CasualTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate{
    
    
    
    
    @IBOutlet weak var CasualTableView: UITableView!
    
    var fassions: [ApparelDataModel] = []
    var apparel = ApparelDataModel()
    
    var CC =  CasualTableViewCell()//CasualTableViewCellのインスタンス

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CasualTableView.backgroundColor = UIColor(named: "CasualCellColor")
        // 背景の透過
        UITabBar.appearance().backgroundImage = UIImage()
        // 境界線の透過
        UITabBar.appearance().shadowImage = UIImage()
        
        CasualTableView.delegate = self
        CasualTableView.dataSource = self
        CasualTableView.register(UINib(nibName: "CasTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        CasualTableView.tableFooterView = UIView()
        
        CasualTableView.estimatedRowHeight = 1000
        CasualTableView.rowHeight = UITableView.automaticDimension
        
        CasualTableView.reloadData()
        
        let Fassions = fassions
        self.fassions = Fassions
        
        loadData()
    }
    
    
    func loadData() {
        fassions.append(ApparelDataModel(id: "1", apparelText: "ブルゾン", apparelImage: "", starButton: false, onePointText: "ブルゾンもNissyぽさをお手軽に出せますね😊", link: "https://zozo.jp/shop/rockymonroe/goods/66947141/?did=110200999&rid=1203"))
        
        fassions.append(ApparelDataModel(id: "2", apparelText: "ボアジャケット（ブラック）", apparelImage: "", starButton: false, onePointText: "インナーが裾から見えるものを選ぶと、差し色になっていいかもです✨", link: "https://zozo.jp/shop/astronomy/goods-sale/60380107/?did=100301252&rid=1203"))
        
        fassions.append(ApparelDataModel(id: "3", apparelText: "スウェット（レッド）", apparelImage: "", starButton: false, onePointText: "The Eternal Live のNissyをイメージして♫", link: "https://zozo.jp/shop/nike/goods/68822087/?did=113460813"))
        
        fassions.append(ApparelDataModel(id: "4", apparelText: "ビッグニット（キャメル）", apparelImage: "", starButton: false, onePointText: "ゆるふわにっとがNissy感を演出します✨", link: "https://zozo.jp/shop/rockymonroe/goods-sale/68139597/?did=112187252"))
        
        fassions.append(ApparelDataModel(id: "5", apparelText: "ビッグスウェット（総柄）", apparelImage: "", starButton: false, onePointText: "柄が強いので無地のパンツを合わせるといいかも", link: "https://cpi.simibuy.online/epitasis/Bqy3bRnYBz.html"))
        
        fassions.append(ApparelDataModel(id: "6", apparelText: "デニムジャケット（ブルー）", apparelImage: "", starButton: false, onePointText: "Nissyのストリート系ならデニムジャケットは外せません✨", link: "https://zozo.jp/shop/levisstore/goods/66639207/?did=109725042&rid=1203"))
        
        fassions.append(ApparelDataModel(id: "7", apparelText: "デニムジャケット（ホワイト）", apparelImage: "", starButton: false, onePointText: "白パンツでセットアップ感を出すのもいいですね😊", link: "https://wear.jp/laitowear/22560158/"))
        
        fassions.append(ApparelDataModel(id: "8", apparelText: "パーカー（ピンク）", apparelImage: "", starButton: false, onePointText: "Nissyを真似るならピンクもチャレンジしてみませんか？♩", link: "https://zozo.jp/shop/mementism/goods-sale/66941677/?did=110212533"))
        
        fassions.append(ApparelDataModel(id: "9", apparelText: "パーカー（ミントグリーン）", apparelImage: "", starButton: false, onePointText: "意外といろんな色にあいますよ♫", link: "https://zozo.jp/shop/yield/goods-sale/68067984/?did=113708020"))
        
        fassions.append(ApparelDataModel(id: "10", apparelText: "パーカー（ネイビー）", apparelImage: "", starButton: false, onePointText: "Nap Timeのパーカーといえば、ですね✨(私感)", link: "https://zozo.jp/shop/lazar/goods-sale/67330158/?did=110829292"))
        
        fassions.append(ApparelDataModel(id: "11", apparelText: "Tシャツ（ブラック）", apparelImage: "", starButton: false, onePointText: "どんなパンツにも合いますが、赤や黄色など奇抜な色は避けるべきかも。🤫", link: "https://zozo.jp/shop/adidas/goods/65315194/?did=107736234"))
        
        fassions.append(ApparelDataModel(id: "12", apparelText: "ビッグシルエットTシャツ（ピンク）", apparelImage: "", starButton: false, onePointText: "白パンツを合わせると夏の雰囲気が感じられます☀️", link: "https://zozo.jp/shop/mementism/goods-sale/10453458/?did=93306177"))
        
        fassions.append(ApparelDataModel(id: "13", apparelText: "ビッグシルエットTシャツ（ブルー）", apparelImage: "", starButton: false, onePointText: "どんな色にもあいます。爽やかな印象を与えますね✨", link: "https://zozo.jp/shop/mementism/goods-sale/10453458/?did=93306177"))
        
        fassions.append(ApparelDataModel(id: "14", apparelText: "ビッグシルエットTシャツ（ホワイト）", apparelImage: "", starButton: false, onePointText: "どんなパンツにも合うけど、黒、デニムがおすすめ♫", link: "https://zozo.jp/shop/mementism/goods-sale/10453458/?did=93306177"))
        
        fassions.append(ApparelDataModel(id: "15", apparelText: "ビッグシルエットTシャツ（ベージュ）", apparelImage: "", starButton: false, onePointText: "春秋っぽさがありますね🌸🍁", link: "https://zozo.jp/shop/diviner/goods/65279726/?did=107676892"))
        
        fassions.append(ApparelDataModel(id: "16", apparelText: "ビッグシルエットシャツ（ピンク）", apparelImage: "", starButton: false, onePointText: "総柄なので無地のパンツを合わせるのがgoodかも✨", link: "https://zozo.jp/shop/aimoha/goods-sale/63943452/?did=105663578"))
        
        fassions.append(ApparelDataModel(id: "17", apparelText: "ビッグシルエットシャツ（ブルー）", apparelImage: "", starButton: false, onePointText: "夏らしい涼しげな爽やかさを演出しましょう🌈", link: "https://zozo.jp/shop/startingover/goods-sale/64819405/?did=107044850"))
        
        fassions.append(ApparelDataModel(id: "18", apparelText: "ビッグシルエットシャツ（ブラック）", apparelImage: "", starButton: false, onePointText: "どんな色にも対応できますね。クールな印象を与えます😊", link: "https://zozo.jp/shop/suburb/goods-sale/64424746/?did=106414636"))
        
        fassions.append(ApparelDataModel(id: "19", apparelText: "ビッグシルエットシャツ（ホワイト）", apparelImage: "", starButton: false, onePointText: "Nissy感を出すならシンプルな無地のものを合わせるといいかもです✨", link: "https://zozo.jp/shop/minority/goods/41638391/?did=69579530"))
        
        fassions.append(ApparelDataModel(id: "20", apparelText: "シャツ（カーキ）", apparelImage: "", starButton: false, onePointText: "シャツが無地なのでチェックパンツを合わせてもいいかも", link: "https://zozo.jp/shop/minority/goods/41638391/?did=69579532"))
        
        fassions.append(ApparelDataModel(id: "21", apparelText: "5分丈パーカー（ブラック）", apparelImage: "", starButton: false, onePointText: "ビッグサイズがNissy感が出ますね✨", link: "https://wear.jp/tosanai/16727156/"))
        
        fassions.append(ApparelDataModel(id: "22", apparelText: "5分丈パーカー（ホワイト）", apparelImage: "", starButton: false, onePointText: "白×黒などモノトーンが無難かも", link: "https://zozo.jp/shop/minority/goods-sale/32363832/?did=56394840"))
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fassions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CasualTableViewCell  //.xibカスタムセル使用時
        let apparelDetaModel :ApparelDataModel = fassions[fassions.count - indexPath.row - 1]
        cell.apparel = apparelDetaModel
        cell.apparelText.text = apparelDetaModel.apparelText
        cell.apparelImage.image = UIImage(named: apparelDetaModel.apparelImage)
        cell.onepointText.text = apparelDetaModel.onePointText
        cell.backgroundColor = UIColor(named: "CasualCellColor")
        cell.tableViewCellDelegate = self
        
        return cell
    }
    
    //Realmの保存処理を
    func like(apparelData: ApparelDataModel) {
        
        let setApparelData = ApparelDataModel()
        setApparelData.apparelText = apparelData.apparelText
        setApparelData.apparelImage = apparelData.apparelImage
        
        print("Realmに保存")
        CC.tableViewCellDelegate = self
        let realm = try! Realm()
        try! realm.write {
            realm.add(setApparelData)
        }
    }
    
    //URLを開く
    func openURL(apparelURL: ApparelDataModel, index: String) {
        CC.tableViewCellDelegate = self
        
        guard let url = URL(string: index) else { return }
            UIApplication.shared.open(url)
    }
    
    
}
