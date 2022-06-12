//
//  PerformanceList.swift
//  TheaterSchedule-sp
//
//  Created by jimi bird on 2022-06-06.
//

import SwiftUI

struct PerformanceList: View {
    
    var body: some View {
        NavigationView {
            List(performances) { performance in
                    NavigationLink(destination: PerformDetail(performance: performance)) {
                        Text(performance.name)
                    
                }
            }
        }
    }
}

struct PerformanceList_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceList()
    }
}
