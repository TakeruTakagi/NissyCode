//
//  FormalTableViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import UIKit
import RealmSwift

class FormalTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate{
    
    
    @IBOutlet weak var FormalTableView: UITableView!
    
    var formalFassions: [ApparelDataModel] = []
    var apparel = ApparelDataModel()
    
    var FC = FormalTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func cellDelegate(){
        FC.delegate = self
    }
    
    func like(apparel: ApparelDataModel) {
        if apparel.starButton == true {
            print("正常にメソッドを呼び出している")
        }
    }
    
    func loadData() {
        formalFassions.append(ApparelDataModel(id: "1", apparelText: "ニット", apparelImage: "1", starButton: false, onePointText: "ゆるふわにっと", link: "http~"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formalFassions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FormalTableViewCell  //.xibカスタムセル使用時
        let apparelDetaModel :ApparelDataModel = formalFassions[formalFassions.count - indexPath.row - 1]
        
        cell.apparelText.text = apparelDetaModel.apparelText
        cell.apparelImage.image = UIImage(named: apparelDetaModel.apparelImage)
        cell.onepointText.text = apparelDetaModel.onePointText
        cell.apparelLink.text = apparelDetaModel.link
        
        return cell
    }
}


