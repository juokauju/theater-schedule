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


struct PerformanceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceDetailView(performance: PerformanceEntity.examples[1])
    }
}

