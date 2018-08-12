//
//  FoodsHistoryViewController.swift
//  FoodTracker
//
//  Created by Susim Samanta on 23/06/18.
 
//

import UIKit

class FoodsHistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFoodItems()
    }
    
    func getFoodItems() {
        if let foods = FoodItemManager.getAllFoodItems() {
            for food in foods {
                print(food.name ?? "nil")
            }
        }
    }

}
