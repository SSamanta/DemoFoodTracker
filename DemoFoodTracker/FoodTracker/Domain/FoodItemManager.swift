//
//  FoodItemManager.swift
//  FoodTracker
//
//  Created by Susim Samanta on 23/06/18.
 
//

import Foundation
import UIKit
import CoreData

class FoodItemManager {
    
    //MARK: Properties
    
    static var dbManager = DatabaseManager()
    
    //MARK: Add food item
    
    static func addFood(title:String, descriptions:String?, image: UIImage?) -> Bool{
        if let foodItem = NSEntityDescription.insertNewObject(forEntityName: "FoodItem", into: dbManager.persistentContainer.viewContext) as? FoodItem {
            foodItem.name = title
            foodItem.descriptions = descriptions
            if let image = image {
                foodItem.image = UIImagePNGRepresentation(image)
            }
            return dbManager.saveContext()
        }
        return false
    }
    
    //MARK: Delete food item
    
    static func deleteFood(foodItem: FoodItem) {
        
    }
    
    //MARK: Get all food items
    
    static func getAllFoodItems() -> [FoodItem]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodItem")
        if let foodItems = try? dbManager.persistentContainer.viewContext.fetch(fetchRequest) as? [FoodItem] {
            return foodItems
        }
        return nil
    }
}
