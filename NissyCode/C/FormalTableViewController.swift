//
//  FormalTableViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import Foundation
import UIKit
import RealmSwift

class FormalTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate{
    
    
    @IBOutlet weak var FormalTableView: UITableView!
    
    var formalFassions: [ApparelDataModel] = []
    var apparel = ApparelDataModel()
    
    var FC = FormalTableViewCell() //FormalTableViewCellのインスタンス
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FormalTableView.backgroundColor = UIColor(named: "FormalCellColor")
        // 背景の透過
        UITabBar.appearance().backgroundImage = UIImage()
        // 境界線の透過
        UITabBar.appearance().shadowImage = UIImage()
        
        FormalTableView.delegate = self
        FormalTableView.dataSource = self
        FormalTableView.register(UINib(nibName: "FormalTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        FormalTableView.tableFooterView = UIView()
        FormalTableView.estimatedRowHeight = 1000
        FormalTableView.rowHeight = UITableView.automaticDimension
        FormalTableView.reloadData()
        
        let formalFassions = formalFassions
        self.formalFassions = formalFassions
        
        loadData()
    }
    
    
    func loadData() {
        formalFassions.append(ApparelDataModel(id: "23", apparelText: "シャツ（ブラウン）", apparelImage: "", starButton: false, onePointText: "シャツを入れることでスマートに見えます。靴はプレーントゥシューズなどを合わせるとよりキマります✨", link: "https://zozo.jp/shop/sitry/goods/59175841/?did=98090523"))
        
        formalFassions.append(ApparelDataModel(id: "24", apparelText: "ロンT（ブラック）", apparelImage: "", starButton: false, onePointText: "黒や白のパンツで合わせモノトーンなコーデもNissyによく見られます👀", link: "https://zozo.jp/shop/billabong/goods/70107862/?did=115107779"))
        
        formalFassions.append(ApparelDataModel(id: "25", apparelText: "フォトプリントロンT（カーキ）", apparelImage: "", starButton: false, onePointText: "淡い色のパンツを合わせるとコーデしやすいと思います", link: "https://zozo.jp/shop/billabong/goods-sale/67855269/?did=111694648"))
        
        formalFassions.append(ApparelDataModel(id: "26", apparelText: "ニット（黒）", apparelImage: "", starButton: false, onePointText: "黒、キャメルなど暗めの色のパンツを合わせるといいかも✨", link: "https://zozo.jp/shop/studious/goods-sale/66982020/?did=110260341"))
        
        formalFassions.append(ApparelDataModel(id: "27", apparelText: "ニット（白）", apparelImage: "", starButton: false, onePointText: "少し大きめのサイズを選んでゆるっとした印象を♫\nNissy感もUP♪", link: "https://zozo.jp/shop/jiggysshop/goods/67929966/?did=111839378"))
        
        formalFassions.append(ApparelDataModel(id: "28", apparelText: "テーラードジャケット", apparelImage: "", starButton: false, onePointText: "インナーはモノトーンのものを選ぶといいかも✨", link: "https://zozo.jp/shop/nanouniverse/goods-sale/68030258/?did=111993705&rid=1203"))
        
        formalFassions.append(ApparelDataModel(id: "29", apparelText: "チェスターコート（キャメル）", apparelImage: "", starButton: false, onePointText: "Nissyコーデをするならチェスターコーデは外せませんね😊", link: "https://zozo.jp/shop/astronomy/goods-sale/60887084/?did=112282312&rid=1203"))
        
        formalFassions.append(ApparelDataModel(id: "30", apparelText: "ロングコート（ブラック）", apparelImage: "", starButton: false, onePointText: "モノトーンを意識するとAddicted感が出ますね✨", link: "https://zozo.jp/shop/nordsud/goods-sale/53066228/?did=88145120&rid=1203"))
        
        formalFassions.append(ApparelDataModel(id: "31", apparelText: "ウールフラシブルゾン", apparelImage: "", starButton: false, onePointText: "パンツもゆったりめのものが合うと思います♩", link: "https://zozo.jp/shop/hare/goods-sale/68949477/?did=113391097&utm_source=google&utm_medium=cpc&utm_campaign=200701_nuu&utm_term=004_&utm_content=ad_nuu_10&gclid=Cj0KCQiA54KfBhCKARIsAJzSrdqGkbU8L3oD8egJCXZY_iawrbyliP7pWehfA0PSUsWJSvY3PmvucQ4aAswcEALw_wcB"))
        
        formalFassions.append(ApparelDataModel(id: "32", apparelText: "チェックシャツ", apparelImage: "", starButton: false, onePointText: "NapTimeを参照しています", link: "https://zozo.jp/shop/ulysses/goods/67157687/?did=110551066"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formalFassions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FormalTableViewCell  //.xibカスタムセル使用時
        let apparelDetaModel :ApparelDataModel = formalFassions[formalFassions.count - indexPath.row - 1]
        cell.apparel = apparelDetaModel
        cell.apparelText.text = apparelDetaModel.apparelText
        cell.apparelImage?.image = UIImage(named: apparelDetaModel.apparelImage)
        cell.onepointText.text = apparelDetaModel.onePointText
        cell.backgroundColor = UIColor(named: "FormalCellColor")
        cell.tableViewCellDelegate = self
        
        return cell
    }
    
    //Realmの保存処理
    func like(apparelData: ApparelDataModel) {
        
        let setApparelData = ApparelDataModel()
        setApparelData.apparelText = apparelData.apparelText
        setApparelData.apparelImage = apparelData.apparelImage
        
        print("Realmに保存")
        FC.tableViewCellDelegate = self
        let realm = try! Realm()
        try! realm.write {
            realm.add(setApparelData)
        }
    }
    
    //URL添付機能
    func openURL(apparelURL: ApparelDataModel, index: String) {
        FC.tableViewCellDelegate = self
        
        guard let url = URL(string: index) else { return }
            UIApplication.shared.open(url)
    }
    
    
}
