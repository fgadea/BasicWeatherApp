//
//  WeatherRepository.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import Foundation

protocol WeatherRepository {
    func getWeather(date: Date) -> Bool
}
