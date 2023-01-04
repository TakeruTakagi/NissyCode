//
//  FormalTableViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import Foundation
import UIKit
import RealmSwift

class FormalTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var FormalTableView: UITableView!
    
    var realm: Realm!
    
    var formalFassions: [ApparelDataModel] = []
    
    let apparel = ApparelDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FormalTableView.register(UINib(nibName: "FormalTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        let formal1 = ApparelDataModel(id: "1", apparelText: "パーカー", apparelImage: "2002", starButton: false, onePointText: "オーバーサイズ", link: "http~~")
        
        
        let formalFassions = [formalFassions]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        realm = try! Realm()
        apparel.starButton = false
        print(apparel.starButton)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formalFassions.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FormalTableViewCell  //.xibカスタムセル使用時
        let apparelDetaModel :ApparelDataModel = formalFassions[formalFassions.count - indexPath.row - 1]
        
        cell.ApparelText.text = apparelDetaModel.apparelText
        cell.apparelImage.image = UIImage(named: "")
        cell.onepointText.text = apparelDetaModel.onePointText
        cell.apparelLink.text = apparelDetaModel.link
        
        return cell
    }
    
    
}
