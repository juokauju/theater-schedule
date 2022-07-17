//
//  PerformanceDetailView.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-29.
//

import SwiftUI

struct PerformanceDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var performance: PerformanceEntity
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20 ) {
                Text(performance.name)
                    .font(.system(size: 50))
                    .padding()
                Text(performance.place.rawValue)
                    .font(.system(size: 16))
                    .padding()
                List(viewModel.datesForPerformanceString, id: \.self) { date in
                    Text(date)
                }
                .listStyle(.inset)
                
                Spacer()
            }
        }
        .onAppear{
            viewModel.groupingPerformancesBy(performance.name)
        }
    }
}


struct PerformanceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceDetailView(performance: PerformanceEntity.examples[1])
    }
}

