//
//  CoreDataManager.swift
//  ForeverSingle
//
//  Created by Swasidhant Chowdhury on 07/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol ContainerDeclaringObject {
    var persistentContainer: NSPersistentContainer{get set}
}

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer!
    
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    convenience init() {
        let appDelegate = UIApplication.shared.delegate as! ContainerDeclaringObject
        self.init(container: appDelegate.persistentContainer)
    }
    
    lazy var backgroundContext: NSManagedObjectContext = {
        return self.persistentContainer.newBackgroundContext()
    }()
    
    
    func addNewAdvantage(desc: String) -> Advantages? {
        if let toDoItem = NSEntityDescription.insertNewObject(forEntityName: "Advantages", into: backgroundContext) as? Advantages  {
            toDoItem.desc = desc
//            print(persistentContainer.persistentStoreCoordinator.persistentStores[0])
            try! backgroundContext.save()
            return toDoItem
        }
        return nil
    }
    
    func addNewAdvantageInViewContext(desc: String) -> Advantages? {
        if let toDoItem = NSEntityDescription.insertNewObject(forEntityName: "Advantages", into: self.persistentContainer.viewContext) as? Advantages  {
            toDoItem.desc = desc
            print(persistentContainer.persistentStoreCoordinator.persistentStores[0])
            try! backgroundContext.save()
            return toDoItem
        }
        return nil
    }
    
    func fetchAll() -> [Advantages] {
        let request: NSFetchRequest<Advantages> = Advantages.fetchRequest()
        let results = try? persistentContainer.viewContext.fetch(request)
        for result in results! {
//            print(result.desc)
        }
        return results ?? []
    }

    func save() {
        if backgroundContext.hasChanges {
            do {
                try backgroundContext.save()
            } catch {
                print("Save error \(error)")
            }
        }
        
    }
}
