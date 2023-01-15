//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import UIKit
import RealmSwift



class FormalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ApparelText: UILabel!
    @IBOutlet weak var starButton: UIButton!
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
