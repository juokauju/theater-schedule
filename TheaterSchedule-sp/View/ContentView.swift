//
//  ContentView.swift
//  TheaterSchedule-sp
//
//  Created by jimi bird on 2022-06-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PerformanceList()
                .tabItem {
                    Label("", systemImage: "list.bullet")
                }
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

