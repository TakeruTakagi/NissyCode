//
//  FavoriteCollection.swift
//  NissyCode
//
//  Created by 髙木　武 on 2023/01/20.
//

import Foundation
import UIKit
import RealmSwift


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
        print(indexPath.row - 1 )
        cell.favoriteName.text = apparelDatamodel.apparelText
        cell.favoriteImage.image = UIImage(named: apparelDatamodel.apparelImage)
        
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
    }
    
    //Realmからデータを取得
    func setData() {
        let realm = try! Realm()
        let result = realm.objects(ApparelDataModel.self)
        favoriteItem = Array(result)
        
        if favoriteItem.count > 0 {
            print(favoriteItem[0].apparelImage)
        }
    }
}
