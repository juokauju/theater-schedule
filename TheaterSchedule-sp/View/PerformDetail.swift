//
//  PerformDetail.swift
//  TheaterSchedule-sp
//
//  Created by jimi bird on 2022-06-04.
//

import SwiftUI

struct PerformDetail: View {
    var performance: Performance
    
    @State private var videoExpended = false
    @State private var lightningExpended = false
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Showing dates")){
                    ForEach(performance.dates, id: \.self) { date in
                        Text(date)
                    }
                }
                
                Section(header: Text("Place")) {
                    Text(performance.place)
                }
                
                Section(header: Text("Teams")) {
                    DisclosureGroup("Video") {
                        ForEach(performance.video, id: \.self) { person in
                            Text(person)
                        }
                    }
                    DisclosureGroup("Lightning", isExpanded: $lightningExpended) {
                        ForEach(performance.lightning, id: \.self) { person in
                            Text(person)
                        }
                    }
                }
                //                .listStyle(GroupedListStyle())
            }
            .navigationTitle(performance.name)
            Spacer()
        }
    }
    
    
    struct PerformDetail_Previews: PreviewProvider {
        static var previews: some View {
            PerformDetail(performance: TestData.performances[0])
        }
        
    }
}
