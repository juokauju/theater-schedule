//
//  Helper.swift
//  TheaterSchedule-sp
//
//  Created by jimi bird on 2022-06-04.
//

import UIKit

//var performances: [Performance] = load("PerformanceData.json")

struct TestData {
    static var performances: [Performance] = {
        let url = Bundle.main.url(forResource: "PerformanceData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        var performances = try! decoder.decode([Performance].self, from: data)
        return performances
    }()
}

//let file = Bundle.main.url(forResource: "PerformanceInfo", withExtension: ".json")
//
//    let data = Data(contentsOf: file)
//
//
//
//
//    let decoder = JSONDecoder()
//    let performances = try decoder.decode(Performance, from: safeData)
//
//


var performances: [Performance] = load("PerformanceData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


