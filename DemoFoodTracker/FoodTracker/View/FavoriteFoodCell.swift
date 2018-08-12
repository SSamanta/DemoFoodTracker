//
//  FavoriteFoodCell.swift
//  FoodTracker
//
//  Created by Susim Samanta on 20/06/18.
 
//

import UIKit

class FavoriteFoodCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func loadCell(title: String, image: UIImage?) {
        self.titleLabel.text = title
        self.imageView.image = image
    }
}
