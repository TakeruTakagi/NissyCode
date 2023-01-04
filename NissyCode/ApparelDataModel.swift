//
//  DataModel.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/27.
//

import Foundation
import UIKit
import RealmSwift

class ApparelDataModel:Object {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var apparelText: String = ""
    @objc dynamic var apparelImage: String = ""
    @objc dynamic var starButton: Bool = false
    @objc dynamic var onePointText: String = ""
    @objc dynamic var link: String = ""
    
    convenience init(id: String, apparelText: String, apparelImage: String, starButton: Bool, onePointText: String, link: String) {
        self.init()
        self.id = id
        self.apparelText = apparelText
        self.apparelImage = apparelImage
        self.starButton = starButton
        self.onePointText = onePointText
        self.link = link
    }
    
}


