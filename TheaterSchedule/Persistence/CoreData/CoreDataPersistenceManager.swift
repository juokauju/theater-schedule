//
//  PerformanceManager.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-27.
//

import Foundation

class CoreDataPersistenceManager: PersistancePresentable {

    static let shared = CoreDataPersistenceManager()
    
    private init() { }
    
    func save(_ performance: PerformanceEntity) {
        _ = performance.convertToManagedObject()
        CoreDataPersistence.shared.saveContext()
    }
    
    func delete(_ performance: PerformanceEntity) {
        guard let performance: Performance = CoreDataPersistence.shared.fetchObject(by: performance.id) else { return }
        CoreDataPersistence.shared.delete(performance)
    }
    
    func get(by id: UUID) -> PerformanceEntity? {
        guard let database: Performance = CoreDataPersistence.shared.fetchObject(by: id) else { return nil }
        let performance = PerformanceEntity.convert(from: database)
        return performance
    }
    
    func getAll() -> [PerformanceEntity] {
        var sorters: [NSSortDescriptor]? = nil
//        if dateOrder {
            sorters = [ NSSortDescriptor(key: "date", ascending: true) ]
//        }
        guard let database: [Performance] = CoreDataPersistence.shared.fetch(sorting: sorters) else { return [] }
        let performances = database.compactMap { (database) -> PerformanceEntity? in PerformanceEntity.convert(from: database) }
        return performances
    }
    
    func getGroup(by propertiesToGroup: [String], fetch properties: [String], in dateOrder: Bool = false) -> [PerformanceEntity] {
        var sorters: [NSSortDescriptor]? = nil
        if dateOrder {
            sorters = [ NSSortDescriptor(key: "date", ascending: true) ]
        }
        guard let database: [Performance] = CoreDataPersistence.shared.fetchGroup(by: propertiesToGroup, fetch: properties, sorting: sorters) else { return [] }
        let performances = database.compactMap { (database) -> PerformanceEntity? in PerformanceEntity.convert(from: database) }
        return performances
    }

}
