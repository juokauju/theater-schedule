//
//  PerformancesList.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-28.
//

import SwiftUI

struct PerformancesList: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.performances) { performance in
                        NavigationLink(destination: PerformanceDetailView(performance: performance)) {
                            PerformanceRow(performance: performance)
                        }
                    }
                    .onDelete(perform: viewModel.delete)
                }
            }
            .navigationTitle(Text("List"))
            .onAppear(perform: viewModel.fetch)
//            .task {
//                await viewModel.reload()
//                print("task")
//            }
//            .overlay(alignment: .top) {
//                if viewModel.error != nil {
//                    ErrorView(error: $viewModel.error)
//                }
//            }
//            .refreshable {
//                await viewModel.reload()
//                print("refreshable")
//            }
        }
    }
}

struct PerformancesList_Previews: PreviewProvider {
    static var previews: some View {
        PerformancesList()
    }
}
