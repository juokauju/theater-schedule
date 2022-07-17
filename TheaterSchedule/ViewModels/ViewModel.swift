//
//  ViewModel.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-06.
//

import Foundation

// ViewModel's main responsibility is to communicate with database: fetch entities(here is just one PerformanceEntity), save it to database and delete it.

class ViewModel: ObservableObject {
    
    //MARK: Properties
    
    // Array of PerformanceEntity with is filled after fetch. Method of fetch runs in ViewModel's init.
    @Published var performances = [PerformanceEntity]()
    
    // Additional ViewModels.
    var formViewModel: FormViewModel
    
    // Array of string dates which comforms same entity name. Value is used in PerformanceDetailView.
    var datesForPerformanceString = [String]()
    
    // Private properties used for grouping dates for the same PerformanceEntity name property.
    private var performancesByName = [PerformanceEntity]()
    private var datesForPerformance = [Date]()
    
    // Database manager.
    private var manager: PersistancePresentable
    
    //MARK: Init
    
    init(manager: PersistancePresentable) {
        self.manager = manager
        
        formViewModel = FormViewModel()
        // Triggers save method(ViewModel) after 'save' button tapped(PerformanceFormView and FormViewModel)
        formViewModel.onSavedTapped = { [weak self] in
            self?.savePerformanceEntity()
        }
        
        // Fetching entities from database and loading @Published var performances property.
        fetchPerformancesEntity()
    }
    
    
    //MARK: Public
    
    public func savePerformanceEntity() {
        var isSaved = false
        
        if let entity = formViewModel.newPerformance {
            // Database manager save method returns boolean.
            isSaved = manager.save(entity)
        }
        
        // After succsesfull process, reloading array.
        if isSaved {
            fetchPerformancesEntity()
            print("manager saved")
        }
    }
    
    public func deleteEntity(at offsets: IndexSet) {
        var isDeleted = false
        
        for index in offsets {
            let performance = performances[index]
            // Database manager delete method returns boolean.
            isDeleted = manager.delete(performance)
        }
        
        // After succsesfull process, reloading array.
        if isDeleted {
            fetchPerformancesEntity()
        }
    }
    
    public func fetchPerformancesEntity() {
            performances = manager.fetchPerformances()
            print("data fetched")
    }
    
    // Grouping entities by property: name. Method is called on appear of PerformanceDetailView.
    public func groupingPerformancesBy(_ name: String) {
        let groupingDictionary = Dictionary(grouping: performances, by: { $0.name })
        if let groupByName = groupingDictionary[name] {
            performancesByName = groupByName
            // Getting array of dates belonging for the same name property.
            getDates()
        }
        
    }
    
    //MARK: Private
    
    private func getDates() {
        datesForPerformanceString.removeAll()
        datesForPerformance = performancesByName.map { $0.date }
        
        for date in datesForPerformance {
            let dateString = Utils.dateFormatter.string(from: date)
            datesForPerformanceString.append(dateString)
        }
    }
}
