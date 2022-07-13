//
//  PerformancesList.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-28.
//

import SwiftUI

struct PerformancesList: View {
    @EnvironmentObject var viewModel: ViewModel
//    private var fetchedPerformances: [PerformanceEntity] = CoreDataPersistenceManager.shared.getAll()
//    private var performances: [PerformanceEntity] = viewModel.listViewModel.listData

    
    @State private var showFormView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.performances) { performance in
                    NavigationLink(destination: PerformanceDetailView(performance: performance)) {
                        PerformanceRow(performance: performance)
                    }
                    //                .navigationBarItems(trailing:
                    //                                        Button(action: {
                    //                    // goto PerformanceFormView
                    //                    self.showFormView.toggle()
                    //                    viewModel.delete()
                    //                }, label: {
                    //                    Image(systemName: "plus")
                    //                        .imageScale(.large)
                    //                        .accessibilityLabel(Text("Add new performance"))
                    //                        .padding()
                    //                }))
                    //                .sheet(isPresented: $showFormView,
                    //                       onDismiss: { print("dismiss!") },
                    //                       content: { PerformanceFormView() })
                }
//                List {
//                    
//                    ForEach(viewModel.formViewModel.performanceEntities) { performanceEntity in
//                        NavigationLink(destination: PerformanceDetailView(performance: performanceEntity)) {
//                            PerformanceRow(performance: performanceEntity)
//                        }
//                    }
//                }
            }
            .navigationTitle(Text("List"))
            
            }
        .onAppear {
            viewModel.fetch()
        }
        .overlay(alignment: .top) {
                    if viewModel.error != nil {
                        ErrorView(error: $viewModel.error)
                    }
                }
        .refreshable {
            await viewModel.reload()
        }
    }
}

struct PerformancesList_Previews: PreviewProvider {
    static var previews: some View {
        PerformancesList()
    }
}
