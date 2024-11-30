//
//  HomeViewModel.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 30/11/24.
//

import Foundation

@Observable
class HomeViewModel {
    var isMetricSystem: Bool = false {
        didSet {
            UserDefaults.standard.set(isMetricSystem, forKey: "isMetricSystem")
        }
    }
    var measurementSystem: String {
        isMetricSystem ? "Metric" : "Imperial"
    }
    var weatherLocation: String = "Helsinki, Finland"
    var searchText: String = ""
    var isSearching: Bool = false
    var upcomingDays: [Day] = [Day(),Day(),Day(),Day(),Day(),Day(),Day()]
    
    init() {
        self.isMetricSystem = UserDefaults.standard.bool(forKey: "isMetricSystem")
    }
}

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

struct Temperature {
    var celsius: Int
    var fahrenheit: Int {
        celsius * 9/5 + 32
    }
}
