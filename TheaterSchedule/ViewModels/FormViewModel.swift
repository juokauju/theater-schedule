//
//  FormViewModel.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-08.
//

import SwiftUI

class FormViewModel: ObservableObject {
    
    //MARK: Properties
    
    @Published var performanceEntities = [PerformanceEntity]()
    @Published var newPerformance = PerformanceEntity(id: UUID(), name: "example", place: PerformanceEntity.Place.naujoji, date: Date())
    
    @Published var name = ""
    @Published var place = PerformanceEntity.Place.self
    @Published var selectedPlace: String = PerformanceEntity.Place.naujoji.rawValue
    @Published var date = Date()
    @Published var allTeamMembers = ["Adomas Gustainis", "Karolis Ziukas", "Richard Zigis", "Kristijonas Zakaras", "Rokas Valiauga"]
    @Published var selectedMembers = [String]()
    
    
    
    
    func addEntity() {
        guard let place = place.init(rawValue: selectedPlace) else { return }
        newPerformance = PerformanceEntity(id: UUID(), name: name, place: place, date: date, team: selectedMembers)
        print("entity added")
        performanceEntities.append(newPerformance)
    }
    
    func clearFields() {
        name = ""
        selectedPlace = PerformanceEntity.Place.naujoji.rawValue
        date = Date()
        selectedMembers = [String]()
        print("fields cleared")
    }
}
