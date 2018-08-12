//
//  DataSourceManager.swift
//  FoodTracker
//
//  Created by Susim Samanta on 20/06/18.
 
//

import Foundation
import UIKit

class DataSourceManager {
    
    //MARK: Plist URL Paths
    
    static var documentsDirectoryURL : URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        if paths.count > 0 {
            return paths[0]
        }
        return nil
    }
    
    static var foodsPlistFileURL: URL? {
        return documentsDirectoryURL?.appendingPathComponent("food.plist")
    }
    
    //MARK: Food CRUD Operations
    
    static func addFood(food: Food?)-> Bool {
        var foods = [[String:Any?]]()
        if let food = food {
            foods.append(food.dictionary)
        }
        return saveFoods(foods: foods, in: foodsPlistFileURL)
    }
    
    static func saveFoods(foods: [[String:Any?]], in url: URL?) -> Bool{
        if let url = url {
            do {
                let foodData = try PropertyListSerialization.data(fromPropertyList: foods, format: .xml, options: 0)
                try foodData.write(to: url)
                return true
            } catch  {
                print(error)
            }
        }
        return false
    }
    
    static func getFoods() -> [Food]? {
        if let foodListURL = foodsPlistFileURL {
            do {
                let data = try Data(contentsOf: foodListURL)
                if let foodsList = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format:nil) as? [[String:Any?]] {
                    var foods = [Food]()
                    for foodDict in foodsList {
                        let name = foodDict["name"] as! String
                        let description = foodDict["description"] as? String
                        var image: UIImage?
                        if let imageData = foodDict["image_data"] as? Data {
                            image = UIImage(data: imageData)
                        }
                        let food = Food(name: name, description:description , image: image)
                        foods.append(food)
                    }
                    return foods
                }
            } catch  {
                print(error)
            }
        }
        return nil
    }
}
