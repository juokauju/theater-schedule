//
//  PersistencePresentible.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-06.
//

import Foundation

protocol PersistancePresentable {
    func save(_ performance: PerformanceEntity) -> Bool
    func delete(_ performance: PerformanceEntity) -> Bool
    func getAll() -> [PerformanceEntity] 
}
