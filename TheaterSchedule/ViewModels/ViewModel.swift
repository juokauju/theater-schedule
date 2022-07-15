//
//  ViewModel.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-06.
//

import Foundation

class ViewModel: ObservableObject {
    
    //MARK: Properties
    
    @Published var performances = [PerformanceEntity]()
    @Published var performancesByName = [PerformanceEntity]()
    var datesForPerformance = [Date]()
    var datesForPerformanceString = [String]()

    @Published var formViewModel = FormViewModel()
    
    private var manager: PersistancePresentable
    
    //MARK: Init
    
    init(manager: PersistancePresentable) {
        self.manager = manager
        fetch()
    }
    
    //MARK: Public
    
    public func save() {
        var saved = false
        
        formViewModel.addEntity()
        saved = manager.save(formViewModel.newPerformance)
        
        if saved {
            fetch()
            print("manager saved")
        }
    }
    
    public func delete(at offsets: IndexSet) {
        var deleted = false
        
        for index in offsets {
            let performance = performances[index]
            deleted = manager.delete(performance)
        }
        
        if deleted {
            fetch()
        }
    }
    
    public func fetch(){
        DispatchQueue.main.async {
            self.performances = self.manager.getAll()
            print("data fetched")
        }
    }
    
    func groupingPerformancesBy(_ name: String) {
        let groupingDictionary = Dictionary(grouping: performances, by: { $0.name })
        if let groupByName = groupingDictionary[name] {
            performancesByName = groupByName
            getDates()
        }
        
    }
    
    private func getDates() {
        datesForPerformanceString.removeAll()
        datesForPerformance = performancesByName.map { $0.date }
        
        for date in datesForPerformance {
            let dateString = Utils.dateFormatter.string(from: date)
            datesForPerformanceString.append(dateString)
        }
    }
}
