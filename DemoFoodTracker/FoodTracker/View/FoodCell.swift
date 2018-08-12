//
//  FoodCell.swift
//  FoodTracker
//
//  Created by Susim Samanta on 18/06/18.
 
//

import UIKit

class FoodCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var foodIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(name: String, description: String?, image: UIImage?) {
        self.nameLabel.text = name
        self.descriptionLabel.text = description
        self.foodIconImageView.image = image
    }

}
