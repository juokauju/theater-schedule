//
//  FirebasePersistenceManager.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-06.
//

import Foundation

class FirebasePersistenceManager: PersistancePresentable {
    
    func getAll() -> [PerformanceEntity] {
        assert(false, "Missing firebase implementation")
        return [PerformanceEntity]()
    }
    
    
    func save(_ performance: PerformanceEntity) {
        assert(false, "Missing firebase implementation")
        print("FirebasePersistenceManager save")
    }
    
    func delete(_ performance: PerformanceEntity) {
        print("FirebasePersistenceManager delete")
    }
}
