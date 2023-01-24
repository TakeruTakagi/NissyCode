//
//  FavoriteCollection.swift
//  NissyCode
//
//  Created by 髙木　武 on 2023/01/20.
//

import Foundation
import UIKit
import RealmSwift


class FavoriteTableView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    
    var apparel = ApparelDataModel()
    var favoriteItem: [ApparelDataModel] = []
    var realm: Realm!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return cell
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
