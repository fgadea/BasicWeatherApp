//
//  LiveWeatherRepository.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import Foundation

class LiveWeatherRepository: WeatherRepository {
    private let remoteService: WeatherRemoteService
    
    init(remoteService: WeatherRemoteService) {
        self.remoteService = remoteService
    }
    
    func getWeather(date: Date) -> Bool {
        return true
    }
}
