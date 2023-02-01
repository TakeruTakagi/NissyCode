//
//  FormalTableViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import Foundation
import UIKit
import RealmSwift

class CasualTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate{
    
    
    @IBOutlet weak var CasualTableView: UITableView!
    
    var fassions: [ApparelDataModel] = []
    var apparel = ApparelDataModel()
    
    var CC =  CasualTableViewCell()//CasualTableViewCellのインスタンス

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        fassions.append(ApparelDataModel(id: "1", apparelText: "ニット", apparelImage: "1", starButton: false, onePointText: "ゆるふわにっと", link: "http~"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fassions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CasualTableViewCell  //.xibカスタムセル使用時
        let apparelDetaModel :ApparelDataModel = fassions[fassions.count - indexPath.row - 1]
        
        cell.apparelText.text = apparelDetaModel.apparelText
        cell.apparelImage.image = UIImage(named: apparelDetaModel.apparelImage)
        cell.onepointText.text = apparelDetaModel.onePointText
        cell.apparelLink.text = apparelDetaModel.link
        
        cell.delegate = self
        
        return cell
    }
    
    //Realmの保存処理を
    func like(apparelData: ApparelDataModel) {
        if apparel.starButton == true {
        print("Realmに保存")
        CC.delegate = self
        let realm = try! Realm()
            try! realm.write {
                apparel.apparelText = apparelData.apparelText
                apparel.apparelImage = apparelData.apparelImage
                realm.add(apparel)
            }
        }
    }
}
