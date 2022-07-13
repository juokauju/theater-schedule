//
//  TheaterScheduleApp.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-01.
//

import SwiftUI

@main
struct TheaterScheduleApp: App {
//    let persistence = CoreDataPersistence.shared
    @StateObject private var viewModel = ViewModel(manager: CoreDataPersistenceManager.shared)
    
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistence.persistentContainer.viewContext)
                .environmentObject(viewModel)
        }
        .onChange(of: scenePhase) { _ in
            CoreDataPersistence.shared.saveContext()
        }
    }
}
