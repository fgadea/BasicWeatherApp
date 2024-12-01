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
    
    private let weatherUseCase: WeatherUseCase
    
    init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
        self.isMetricSystem = UserDefaults.standard.bool(forKey: "isMetricSystem")
    }
}
