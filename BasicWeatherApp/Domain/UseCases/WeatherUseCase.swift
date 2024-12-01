//
//  WeatherUseCase.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import Foundation

protocol WeatherUseCase {
    func execute(input: Date) -> Bool
}

class LiveWeatherUseCase: WeatherUseCase {
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func execute(input: Date) -> Bool {
        return true
    }
}
