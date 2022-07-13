//
//  PerformanceDetailView.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-29.
//

import SwiftUI

struct PerformanceDetailView: View {
    
    var performance: PerformanceEntity
    
    var body: some View {
        VStack{
            Text(performance.name)
                .font(.system(size: 50))
            Text(performance.place.rawValue)
                .font(.system(size: 16))
            Text(Utils.dateFormatter.string(from: performance.date))
            
        }
    }
}

#if DEBUG
struct PerformanceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceDetailView(performance: PerformanceEntity(id: UUID(), name: "Boksas", place: .naujoji, date: Date(), team: ["Antanas", "Adomas"]))
    }
}
#endif
