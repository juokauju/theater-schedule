//
//  Utils.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-29.
//

import Foundation

struct Utils {
    
    static let dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withFullDate
        return formatter
    }()
}
