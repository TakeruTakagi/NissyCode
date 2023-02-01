//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2023/01/24.
//

import UIKit
import RealmSwift

protocol CustomCellDelegate2 {
    func offlike(apparel: ApparelDataModel, index:Int) //セルのパスを取ってくる
}

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteName: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var apparel = ApparelDataModel()
    var index = 0
    
    var delegate: CustomCellDelegate2?
    
    let white = UIImage(named: "白")
    let state = UIControl.State.normal
    let vib = UIImpactFeedbackGenerator(style: .medium)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func offLike(_ sender: Any) {
        vib.impactOccurred()
        apparel.starButton = false
        print(apparel.starButton)
        
        if apparel.starButton == false {
            favoriteButton.setImage(white, for: .normal)
        }
        delegate?.offlike(apparel: apparel, index: index)
    }
}
