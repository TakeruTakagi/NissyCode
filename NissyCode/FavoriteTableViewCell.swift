//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import UIKit

class FormalTableViewCell: UITableViewCell {
    var favoriteFlag: Bool = false
    @IBOutlet weak var ApparelText: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBAction func starButton(_ sender: Any) {
        var image: UIImage?
        if favoriteFlag {
            guard let starImage = UIImage(named: "favoriteStar") else {return}
            image = starImage
        } else {
            guard let starImage = UIImage(named: "favoriteStarBlank") else {return}
            image = starImage
        }
        starButton.setImage(image, for: UIControl.State())
        favoriteFlag = !favoriteFlag
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
