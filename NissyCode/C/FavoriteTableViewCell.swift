//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2023/01/24.
//

import UIKit
import RealmSwift

protocol CustomCellDeleteDelegate {
    func offlike(apparel: ApparelDataModel, index:Int) //セルのパスを取ってくる
}

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteName: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var apparel = ApparelDataModel()
    var index: Int = 0
    
    var deleteDelegate: CustomCellDeleteDelegate?
    
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
        
        deleteDelegate?.offlike(apparel: apparel, index: index)
    }
}
