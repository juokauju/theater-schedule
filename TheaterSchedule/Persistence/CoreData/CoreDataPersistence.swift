//
//  CoreDataPersistence.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-26.
//

import Foundation
import CoreData

class CoreDataPersistence: NSObject {
    
    static let shared = CoreDataPersistence()
    
    private override init() { }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentCloudKitContainer(name: "TheaterSchedule")
        
        // get the store description
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("Could not retrieve a persistent store description.")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                ErrorHandler.shared.alertErrorMessage(error)
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                ErrorHandler.shared.alertErrorMessage(nserror)
            }
        }
    }
    
    func fetchObject<T: NSManagedObject>(by id: UUID) -> T? {
        let predicate = NSPredicate(format: "id == %@", id.uuidString)
        let result: [T]? = self.fetch(where: NSCompoundPredicate(andPredicateWithSubpredicates: [predicate]))
        return result?.first
    }
    
    func fetch<T: NSManagedObject>(where predicates: NSCompoundPredicate? = nil, sorting sorters: [NSSortDescriptor]? = nil) -> [T]? {
        let context = persistentContainer.viewContext
        let entityName = String(describing: T.self)
        let request = NSFetchRequest<T>(entityName: entityName)
        if let conditions = predicates {
            request.predicate = conditions
        }
        if let sortDescriptors = sorters {
            request.sortDescriptors = sortDescriptors
        }
        
        do {
            let records = try context.fetch(request)
            return records
        } catch {
            let nserror = error as NSError
            ErrorHandler.shared.alertErrorMessage(nserror)
            return nil
        }
    }
    
    func fetchGroup<T: NSManagedObject>(by propertiesToGroup: [String], fetch properties: [String], where predicates: NSCompoundPredicate? = nil, sorting sorters: [NSSortDescriptor]? = nil) -> [T]? {
        let context = persistentContainer.viewContext
        let entityName = String(describing: T.self)
        let request = NSFetchRequest<T>(entityName: entityName)
        if let conditions = predicates {
            request.predicate = conditions
        }
        if let sortDescriptors = sorters {
            request.sortDescriptors = sortDescriptors
        }
        
        request.resultType = .dictionaryResultType
        request.propertiesToFetch = properties
        request.propertiesToGroupBy = propertiesToGroup
        
        do {
            let records = try context.fetch(request)
            return records
        } catch {
            let nserror = error as NSError
            ErrorHandler.shared.alertErrorMessage(nserror)
            return nil
        }
    }
    
    func initManagedObject<T: NSManagedObject>() -> T {
        let managedObj = T(context: persistentContainer.viewContext)
        return managedObj
    }
    
    func delete(_ object: NSManagedObject) {
        persistentContainer.viewContext.delete(object)
        saveContext()
    }
}
