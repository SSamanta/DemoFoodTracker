//
//  AddMenuViewController.swift
//  FoodTracker
//
//  Created by Susim Samanta on 15/06/18.
 
//

import UIKit

enum SceneType {
    case addFood
    case browseFood
}

class FoodViewController: UIViewController {
    
    //MARK: Params
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    var sceneType: SceneType = .addFood
    var food: Food?
    
    //MARK: View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesignLayout()
        loadInitialScene()
    }

    //MARK: Load Initial Scene
    
    func loadInitialScene() {
        switch self.sceneType {
        case .addFood:
            self.title = "Add Food"
        case .browseFood:
            self.title = "Food"
            self.navigationItem.leftBarButtonItem = nil
            loadFoodScene()
        }
    }
    
    func applyDesignLayout() {
        self.nameField.setRoundedBorder()
        self.descriptionField.setRoundedBorder()
    }
    //MARK: Load with food
    
    func loadFood(food: Food?) {
        self.food = food
        self.sceneType = .browseFood
    }
    
    //MARK: Load Foods
    
    func loadFoodScene() {
        self.nameField.text = self.food?.name
        self.descriptionField.text = self.food?.description ?? "Enter your food description"
        self.imageView.image = self.food?.image
    }
    
    //MARK: Actions
    
    @IBAction func selectImageFromPhoto(_ sender: UITapGestureRecognizer) {
        browsePhoto()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if validate() {
            if saveFood(name: self.nameField.text ?? "", description: self.descriptionField.text, image: self.imageView.image) {
                self.navigationController?.popToRootViewController(animated: true)
            }else {
                print("Something went wrong!")
            }
        }
    }
    
    //MARK: Pick Image
    func browsePhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: Validate Fields
    
    func validate()-> Bool {
        if let name = self.nameField.text {
            if name.isEmpty {
                return false
            }
            return true
        }
        return false
    }
    
    //MARK: Save Food
    
    func saveFood(name: String, description: String?, image: UIImage?) -> Bool {
        /*return FoodItemManager.addFood(title:name, descriptions:description, image:image) // core data based methods*/
        let food = Food(name: name, description: description, image: image)
        return DataSourceManager.addFood(food: food)
    }
}

extension FoodViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension FoodViewController : UITextViewDelegate,UITextFieldDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter food description" {
            textView.text = ""
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if range.length == 0 {
            if text == "\n" {
                textView.resignFirstResponder()
                return false
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}

extension UIView {
    //Extension to set rounded broder
    func setRoundedBorder() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 2.5
    }
}
