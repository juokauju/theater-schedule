//
//  ContentView.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-01.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        TabView {
            PerformancesList()
                .tabItem {
                    Label("", systemImage: "list.bullet")
                }
            PerformanceFormView(formViewModel: viewModel.formViewModel)
                .tabItem {
                    Label("", systemImage: "plus")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
