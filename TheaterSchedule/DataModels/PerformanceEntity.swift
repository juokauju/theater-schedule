//
//  PerformanceConvert.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-26.
//

import SwiftUI

struct PerformanceEntity: Identifiable {

    var id: UUID
    var name: String
    var place: Place
    var date: Date
    var team: [String]?
    
    enum Place: String, CaseIterable, Identifiable {
        case didzioji
        case naujoji
        case mazoji
        case studija
        
        var id: String { self.rawValue }
    }
    
    
    //MARK: Core Data Convert functions
    
    static func convert(from database: Performance) -> PerformanceEntity? {
        guard let id = database.id,
              let name = database.name,
              let placeText = database.place,
              let place = Place(rawValue: placeText),
              let date = database.date,
              let team = database.team
        else {
            return nil
        }
        
        return PerformanceEntity(id: id, name: name, place: place, date: date, team: team)
    }
    
    func convertToManagedObject() -> Performance {
        let performance: Performance = CoreDataPersistence.shared.initManagedObject()
        performance.id = self.id
        performance.name = self.name
        performance.place = self.place.rawValue
        performance.date = self.date
        performance.team = self.team
        return performance
    }
    
    
    //MARK: if DEBUG
    
    #if DEBUG
    static let examples = [
        PerformanceEntity(id: UUID(), name: "Boksas", place: .naujoji, date: Date(), team: ["Karolis Ziukas"]),
        PerformanceEntity(id: UUID(), name: "Alisa", place: .mazoji, date: Date.now.addingTimeInterval(86400), team: ["Adomas Gustainis, Karolis Ziukas"]),
        PerformanceEntity(id: UUID(), name: "Respublika", place: .didzioji, date: Date.now.addingTimeInterval(598400), team: ["Ricard Zigis"])
    ]
    #endif
}

