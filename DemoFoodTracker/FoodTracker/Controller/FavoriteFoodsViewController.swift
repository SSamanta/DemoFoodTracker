//
//  FavoriteFoodsViewController.swift
//  FoodTracker
//
//  Created by Susim Samanta on 20/06/18.
 
//

import UIKit

class FavoriteFoodsViewController: UIViewController {

    //MARK: Params
    var foods = [Food]()
    
    //MARK: View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareFoods()
    }

    //MARK: Prepare data models
    
    func prepareFoods() {
        let burger = Food(name: "Burger", description: "Burger bla bla bla", image:#imageLiteral(resourceName: "burger"))
        let chips = Food(name: "Chips", description: "Chips ......", image:#imageLiteral(resourceName: "chips"))
        let pizza = Food(name: "Pizza", description:"Pizza", image:#imageLiteral(resourceName: "pizza"))
        
        self.foods = [burger,chips,pizza]
    }
}

extension FavoriteFoodsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favoriteFoodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteFoodCell", for: indexPath) as! FavoriteFoodCell
        let food = self.foods[indexPath.item]
        favoriteFoodCell.loadCell(title: food.name, image: food.image)
        return favoriteFoodCell
    }
    
}
