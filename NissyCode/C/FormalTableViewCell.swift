//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import UIKit
import RealmSwift



class FormalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var apparelText: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var apparelImage: UIImageView!
    @IBOutlet weak var onepointText: UILabel!
    @IBOutlet weak var apparelLink: UILabel!
    
    var realm: Realm!
    
    var formalData = ApparelDataModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //お気に入りしたらボタンの色が変わる
    @IBAction func Like(_ sender: Any) {
        
        formalData.starButton = formalData.starButton == false ? true : false
        
        if formalData.starButton == true {
            starButton.backgroundColor = .blue
        }else{
            starButton.backgroundColor = .clear
        }
        
    }
    
    @IBAction func add(_ sender: Any) {
        formalData.apparelText = apparelText.text ?? "Undefind"
        formalData.onePointText = onepointText.text ?? "Undefind"
        formalData.link = apparelLink.text ?? "Undefind"
        formalData.apparelImage = apparelImage.textInputContextIdentifier ?? "Undefind"
        
    }
    
}



