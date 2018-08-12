//
//  DatabaseManager.swift
//  FoodTracker
//
//  Created by Susim Samanta on 23/06/18.
//

import Foundation
import CoreData
class DatabaseManager {
    
    //MARK: Core Data Stack
    
    lazy var persistentContainer : NSPersistentContainer =  {
       let container = NSPersistentContainer(name: "FoodModel")
        container.loadPersistentStores(completionHandler: { (storeDEscription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() -> Bool{
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        return false
    }
}
