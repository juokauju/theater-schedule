//
//  TheaterScheduleApp.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-01.
//

import SwiftUI

@main
struct TheaterScheduleApp: App {
    @StateObject private var viewModel = ViewModel(manager: CoreDataPersistenceManager.shared)
    
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
        .onChange(of: scenePhase) { _ in
            viewModel.savePerformanceEntity()
        }
    }
}
