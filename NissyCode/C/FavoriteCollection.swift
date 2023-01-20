//
//  FavoriteCollection.swift
//  NissyCode
//
//  Created by 髙木　武 on 2023/01/20.
//

import Foundation
import UIKit


class FavoriteCollection: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var favoriteImage: [ApparelDataModel] = []
    
    override func viewDidLoad() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath)
        
        return cell
    }
    
}
