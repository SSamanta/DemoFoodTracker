//
//  Food.swift
//  FoodTracker
//
//  Created by Susim Samanta on 18/06/18.
 
//

import UIKit

class Food {
    
    //MARK: Parameters
    
    var name: String
    var description: String?
    var image: UIImage?
    
    //MARK: Initializer
    
    init(name: String, description: String?, image: UIImage?) {
        self.name = name
        self.description = description
        self.image = image
    }
}

extension Food {
    
    //MARK: Formatted Dictionary
    var dictionary : [String:Any?] {
        get {
            if let image = self.image {
                return ["name":self.name,"description": self.description,"image_data": UIImagePNGRepresentation(image)]
            }
            return ["name":self.name,"description": self.description]
        }
    }
    
}
