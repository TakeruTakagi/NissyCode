//
//  FormalTableViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import UIKit
import RealmSwift

class CasualTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var CasualTableView: UITableView!
    
    var casualFassions: [ApparelDataModel] = []
    var apparel = ApparelDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CasualTableView.delegate = self
        CasualTableView.dataSource = self
        CasualTableView.register(UINib(nibName: "FormalTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        CasualTableView.tableFooterView = UIView()
        
        CasualTableView.estimatedRowHeight = 1000
        CasualTableView.rowHeight = UITableView.automaticDimension
        
        CasualTableView.reloadData()
        
        let casualFassions = casualFassions
        self.casualFassions = casualFassions
        
        loadData()
        
    }
    
    func loadData() {
        casualFassions.append(ApparelDataModel(id: "1", apparelText: "ニット", apparelImage: "1", starButton: false, onePointText: "ゆるふわにっと", link: "http~"))
        casualFassions.append(ApparelDataModel(id: "1", apparelText: "ニット", apparelImage: "1", starButton: false, onePointText: "ゆるふわにっと", link: "http~"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casualFassions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FormalTableViewCell  //.xibカスタムセル使用時
        let apparelDetaModel :ApparelDataModel = casualFassions[casualFassions.count - indexPath.row - 1]
        
<<<<<<< HEAD
        cell.ApparelText.text = apparelDetaModel.apparelText
        cell.apparelImage.image = UIImage(named: apparelDetaModel.apparelImage)
=======
        cell.apparelText.text = apparelDetaModel.apparelText
        
        cell.apparelImage.image = UIImage(named: "")
>>>>>>> 6fc43a8efb2f0cab2022174cbe7a14f6eb313ba7
        cell.onepointText.text = apparelDetaModel.onePointText
        cell.apparelLink.text = apparelDetaModel.link
        
        return cell
    }
    
    
}
