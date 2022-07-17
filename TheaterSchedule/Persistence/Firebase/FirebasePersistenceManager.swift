//
//  FirebasePersistenceManager.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-06.
//

import Foundation

class FirebasePersistenceManager: PersistancePresentable {
    
    func fetchPerformances() -> [PerformanceEntity] {
        assert(false, "Missing firebase implementation")
        return [PerformanceEntity]()
    }
    
    func save(_ performance: PerformanceEntity) -> Bool {
        assert(false, "Missing firebase implementation")
        print("FirebasePersistenceManager save")
        return false
    }
    
    func delete(_ performance: PerformanceEntity) -> Bool {
        assert(false, "Missing firebase implementation")
        print("FirebasePersistenceManager delete")
        return false
    }
}
