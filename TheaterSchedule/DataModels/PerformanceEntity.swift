//
//  PerformanceConvert.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-26.
//

import SwiftUI





//class ViewModel: ObservableObject {
//
//    //MARK: Properties
//
//    struct DataEntry {
//
//    }
//
//    @Published var dateEntries = [DataEntry]()
//
//    @Published var name = ""
//
//    private var manager: PersistancePresentable
//
//    //MARK: Init
//
//    init(manager: PersistancePresentable) {
//        self.manager = manager
//
//        dateEntries = manager.getEntries()
//    }
//
//    //MARK: Public
//    public func save(place: PerformanceEntity.Place, date: Date, team: [String]?) {
//        let newPerformance = PerformanceEntity(id: UUID(),
//                                            name: name,
//                                            place: place,
//                                            date: date,
//                                            team: team)
//        dateEntries.append(entries)
//        manager.save(newPerformance)
//    }
//
//    public func delete() {
////        manager.delete(<#PerformanceLog#>)
//    }
//}


import Foundation

struct PerformanceEntity: Identifiable {

    var id: UUID //?
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
    
    //MARK: Convert functions

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
}

