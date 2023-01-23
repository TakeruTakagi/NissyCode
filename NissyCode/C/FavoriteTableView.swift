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
    
    var favoriteImage: [ApparelDataModel] = []
    var realm: Realm!
    var fassions: [ApparelDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setData()
        favoriteTableView.reloadData()
    }
    
    func setData() {
        let realm = try! Realm()
        let favoriteFassions = realm.objects(ApparelDataModel.self)
        
        fassions = Array(favoriteFassions)
        
        if fassions.count > 0 {
            print("\(fassions[0].apparelImage)を取得")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = favoriteTableView.dequeueReusableCell(withIdentifier: "favoriteTableView", for: indexPath)
        return cell
    }
    
    
}
