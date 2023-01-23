//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import Foundation
import UIKit
import RealmSwift

protocol CustomCellDelegate {
    func like(apparelData: ApparelDataModel)
}


class FormalTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var apparelText: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var apparelImage: UIImageView!
    @IBOutlet weak var onepointText: UILabel!
    @IBOutlet weak var apparelLink: UILabel!
    
    var realm: Realm!
    
    var delegate: CustomCellDelegate?
    
    var apparel = ApparelDataModel()
    let lip = UIImage(named: "lip")
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
    
    
    
    //お気に入り機能
    @IBAction func Like(_ sender: Any) {
        vib.impactOccurred()
        //ボタンの切り替わり
        apparel.starButton = apparel.starButton == false ? true : false
        print(apparel.starButton)
        //ボタンの色変わり　→ 後から画像との差し替えを考える
        
        if apparel.starButton == true {
            starButton.tintColor = .clear
            starButton.setImage(lip, for: state)
        }else {
            starButton.tintColor = .lightGray
            starButton.setImage(white, for: .normal)
        }
        delegate?.like(apparelData: apparel) //
    }
    
    
}
