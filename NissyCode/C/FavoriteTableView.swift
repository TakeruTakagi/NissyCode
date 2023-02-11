//
//  FavoriteCollection.swift
//  NissyCode
//
//  Created by 髙木　武 on 2023/01/20.
//

import Foundation
import UIKit
import RealmSwift
import SwiftMessages


class FavoriteTableView: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDeleteDelegate{
    
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    
    var apparel = ApparelDataModel()
    var favoriteItem: [ApparelDataModel] = []
    
    var realm: Realm!
    
    var FVC = FavoriteTableViewCell()
    var FC = FormalTableViewCell()
    var CC = CasualTableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteTableView.backgroundColor = UIColor(named: "FavoriteColor")
        // 背景の透過
        UITabBar.appearance().backgroundImage = UIImage()
        // 境界線の透過
        UITabBar.appearance().shadowImage = UIImage()
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        setData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        favoriteTableView.register(UINib(nibName: "FavoriteTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        favoriteTableView.estimatedRowHeight = 1000
        favoriteTableView.rowHeight = UITableView.automaticDimension
        setData()
        favoriteTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteItem.count
    }
    
    
    //どんなセルを表示するか
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FavoriteTableViewCell
        let apparelDatamodel: ApparelDataModel = favoriteItem[favoriteItem.count - indexPath.row - 1]
        
        cell.favoriteName.text = apparelDatamodel.apparelText
        cell.favoriteImage.image = UIImage(named: apparelDatamodel.apparelImage)
        cell.backgroundColor = UIColor(named: "FavoriteColor")
        cell.deleteDelegate = self
        
        return cell
    }
    
    
    func offlike(apparel: ApparelDataModel, index: Int) {
        FVC.deleteDelegate = self
        let realm = try! Realm()
        try! realm.write {
            let item = favoriteItem[index]
            realm.delete(item)
        }
        setData()
        favoriteTableView.reloadData()
        
        //ボタンを押した際のメッセージ
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(body: "お気に入りから削除されました")
        view.configureDropShadow()
        view.layoutMarginAdditions = UIEdgeInsets(top: 20,
                              left: 20,
                              bottom: 20,
                              right: 20)
        view.configureTheme(.success)
        view.titleLabel?.isHidden = true
        view.iconLabel?.isHidden = true
        view.button?.isHidden = true
        // 角丸を指定します
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        // アラートを表示します
        SwiftMessages.show(view: view)
    }
    
    //Realmからデータを取得
    func setData() {
        let realm = try! Realm()
        let result = realm.objects(ApparelDataModel.self)
        favoriteItem = Array(result)
        
        
    }
}
