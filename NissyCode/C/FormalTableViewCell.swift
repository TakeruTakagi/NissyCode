//
//  FavoriteTableViewCell.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import Foundation
import UIKit
import RealmSwift

protocol TableViewCellDelegate {
    func like(apparelData: ApparelDataModel)
    func openURL(apparelURL: ApparelDataModel, index: String)
}

class FormalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var apparelText: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var apparelImage: UIImageView!
    @IBOutlet weak var onepointText: UILabel!
    @IBOutlet weak var link: UIButton!
    
    
    var tableViewCellDelegate: TableViewCellDelegate?
    
    var apparel = ApparelDataModel()
    let lip = UIImage(named: "lip")
    let star = UIImage(named: "星")
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
        
        //ボタン → 画像との差し替え
        if apparel.starButton == true {
            starButton.tintColor = .clear
            starButton.setImage(lip, for: state)
        }else {
            starButton.tintColor = .lightGray
            starButton.setImage(star, for: .normal)
        }
        if apparel.starButton == true {
            tableViewCellDelegate?.like(apparelData: apparel)
        }
    }
    
    //URLを開く
    @IBAction func openURL(_ sender: Any) {
        tableViewCellDelegate?.openURL(apparelURL: apparel, index: apparel.link)
    }
    
    
}
