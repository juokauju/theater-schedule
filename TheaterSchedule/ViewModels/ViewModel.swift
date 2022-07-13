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
    @Published var error: Error?

    @Published var formViewModel = FormViewModel()
    var listViewModel = ListViewModel()
    
    private var manager: PersistancePresentable
    
    //MARK: Init
    
    init(manager: PersistancePresentable) {
        self.manager = manager
    }
    
    //MARK: Public
    
    public func save() {
        formViewModel.addEntity()
        manager.save(formViewModel.newPerformance)
        print("manager saved")
    }
    
    public func delete() {
        
    }
    
    public func fetch(){
        performances = manager.getAll()
        print("data fetched")
    }
    
    func reload() async {
//        do {
            performances = await manager.getAll()
//            error = nil
//        } catch {
//            self.error = error
//        }
    }
    
//    func fetchData() -> [PerformanceEntity] {
//        let dataFromCoreData = CoreDataPersistenceManager.shared.getAll()
//        let dataEntries = formViewModel.performanceEntities
//        let allTogetger = dataFromCoreData + dataEntries
//        let performances = allTogetger.sorted(by: { $0.date < $1.date })
//        return dataFromCoreData
    
}
