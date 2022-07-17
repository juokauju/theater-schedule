//
//  FormViewModel.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-08.
//

import SwiftUI

// Takes care of all data applied in PerformanceFormView.
class FormViewModel: ObservableObject {
    
    //MARK: Properties
    
    // Not sure if still needed
//    @Published var performanceEntities = [PerformanceEntity]()
    
    // Formed new entity is placed in newPerformace property.
    var newPerformance: PerformanceEntity?
    
    // properties and bindings for PerformanceFormView, MultiSelectPickerView
    @Published var name = ""
    @Published var place = PerformanceEntity.Place.self
    @Published var selectedPlace: String = PerformanceEntity.Place.naujoji.rawValue
    @Published var date = Date()
    @Published var selectedDays = [Date]()
    @Published var allTeamMembers = ["Adomas Gustainis", "Karolis Ziukas", "Richard Zigis", "Kristijonas Zakaras", "Rokas Valiauga"]
    @Published var selectedMembers = [String]()
    
    // Triggers save method
    var onSavedTapped: (() -> Void)?
    
    
    //MARK: - Actions
    
    func saveTapped() {
        createNewEntity()
        clearFields()
        onSavedTapped?()
    }
    
    //MARK: - Private
    
    private func createNewEntity() {
        guard let place = place.init(rawValue: selectedPlace) else { return }
        newPerformance = PerformanceEntity(id: UUID(), name: name, place: place, date: date, team: selectedMembers)
        print("entity added")
    }
    
    private func clearFields() {
        name = ""
        selectedPlace = PerformanceEntity.Place.naujoji.rawValue
        date = Date()
        selectedMembers = [String]()
        print("fields cleared")
    }
    
}
