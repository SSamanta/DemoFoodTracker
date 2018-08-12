//
//  FoodsViewController.swift
//  FoodTracker
//
//  Created by Susim Samanta on 18/06/18.
 
//

import UIKit

class RecentFoodsViewController: UIViewController {

    //MARK: Params
    var foods = [Food]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //prepareFoods() // From Static Model
    }

    override func viewWillAppear(_ animated: Bool) {
        getFoods()
    }
    
    //MARK: Prepare data models
    
    func prepareFoods() {
        let burger = Food(name: "Burger", description: "Burger bla bla bla", image:#imageLiteral(resourceName: "burger"))
        let chips = Food(name: "Chips", description: "Chips ......", image:#imageLiteral(resourceName: "chips"))
        let pizza = Food(name: "Pizza", description:"Pizza", image:#imageLiteral(resourceName: "pizza"))
        
        self.foods = [burger,chips,pizza]
    }
    
    //MARK: Get Foods from local
    
    func getFoods() {
        if let foods = DataSourceManager.getFoods() {
            self.foods = foods
            self.tableView.reloadData()
        }
    }
    
    //MARK: Actions
    
    @IBAction func addFood(_ sender: UIBarButtonItem) {
        loadAddFoodScene()
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.loadLoginScene()
        }
    }
    
    //MARK: Navigations
    
    func loadAddFoodScene() {
        if let addFoodScene = self.storyboard?.instantiateViewController(withIdentifier: "AddFoodScene") as? UINavigationController {
            present(addFoodScene, animated: true, completion: nil)
        }
    }
    
    func browseFoodScene(food: Food?) {
        if let foodScene = self.storyboard?.instantiateViewController(withIdentifier: "FoodScene") as? FoodViewController {
            foodScene.loadFood(food: food)
            self.navigationController?.pushViewController(foodScene, animated: true)
        }
    }
}

extension RecentFoodsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodCell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        let food = self.foods[indexPath.row]
        foodCell.setCell(name: food.name, description: food.description, image: food.image)
        return foodCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let food = self.foods[indexPath.row]
        browseFoodScene(food: food)
    }
}
