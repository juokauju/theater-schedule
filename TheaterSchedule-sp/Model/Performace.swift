//
//  PerformaceInfo.swift
//  TheaterSchedule-sp
//
//  Created by jimi bird on 2022-06-03.
//

import SwiftUI


struct Performance: Decodable, Identifiable, Equatable {
    var id: Int
    var name: String
    var dates: [String]
    var place: String
    var video: [String]
    var lightning: [String]
}

