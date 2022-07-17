//
//  PerformanceRow.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-28.
//

import SwiftUI

struct PerformanceRow: View {
    var performance: PerformanceEntity
    
    var body: some View {
        HStack {
            Text(performance.name.uppercased())
                .font(.system(.title3, design: .rounded))
            Spacer()
            Text(Utils.dateFormatter.string(from: performance.date))
                .font(.system(.title3, design: .rounded))
        }
    }
}


struct PerformanceRow_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceRow(performance: PerformanceEntity.examples[0])
            .previewLayout(.sizeThatFits)
    }
}

