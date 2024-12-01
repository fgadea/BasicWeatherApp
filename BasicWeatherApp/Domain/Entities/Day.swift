//
//  Day.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import Foundation

struct Day: Equatable, Identifiable {
    var id = UUID()
    var date: Date = .now.addingTimeInterval(Double.random(in: 0..<604800))
    var temperature: Temperature = .init(celsius: 20) // Celsius by default
    var maxTemperature: Temperature = .init(celsius: 34)
    var minTemperature: Temperature = .init(celsius: -20)
    
    static func == (lhs: Day, rhs: Day) -> Bool {
        lhs.id != rhs.id
    }
}
