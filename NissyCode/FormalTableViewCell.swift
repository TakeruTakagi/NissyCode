//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import UIKit
import RealmSwift

class FormalTableViewCell: UITableViewCell {
    
    var favoriteFlag: Bool = false
    let apparel = ApparelDataModel()
    
    var realm: Realm!
    
    @IBOutlet weak var ApparelText: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    @IBAction func Like(_ sender: Any) {
        apparel.starButton = true
    }
    
    @IBAction func add(_ sender: Any) {
        try! realm.write{
            realm.add(apparel)
        }
    }
    
    @IBOutlet weak var apparelImage: UIImageView!
    @IBOutlet weak var onepointText: UILabel!
    @IBOutlet weak var apparelLink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
