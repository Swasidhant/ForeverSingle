//
//  ForeverSingleTests.swift
//  ForeverSingleTests
//
//  Created by Swasidhant Chowdhury on 09/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import XCTest
import CoreData
@testable import ForeverSingle

class ForeverSingleTests: XCTestCase {
    var demoManager: CoreDataManager!
    
    override func setUp() {
        super.setUp()
         demoManager = CoreDataManager(container: mockPersistantContainer)
        self.initialSetting()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.deleteAllData()
    }
    
    
    //MARK:- initialization code
    func initialSetting() {
        insertAdvantage(desc: "demo1")
        insertAdvantage(desc: "demo2")
        insertAdvantage(desc: "demo3")
        
        do {
            try mockPersistantContainer.viewContext.save()
        }  catch {
            print(" error \(error)")
        }
        
    }
    
    func insertAdvantage(desc: String) -> Advantages? {
        let advantage = NSEntityDescription.insertNewObject(forEntityName: "Advantages", into: mockPersistantContainer.viewContext) as! Advantages
        advantage.desc = desc
        return advantage
    }
    
    func deleteAllData() {
        let fetchRequest:NSFetchRequest<Advantages> = Advantages.fetchRequest()
        let arrAdvantages = try! mockPersistantContainer.viewContext.fetch(fetchRequest)
        for advantage in arrAdvantages {
            mockPersistantContainer.viewContext.delete(advantage)
        }
        try! mockPersistantContainer.viewContext.save()

    }

    
    //MARK:- core data
    lazy var mockPersistantContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ForeverSingle", managedObjectModel: self.managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )

            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle(for: type(of: self))] )!
        return managedObjectModel
    }()
    
}
