//
//  Temperature.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import Foundation

struct Temperature {
    var celsius: Int
    var fahrenheit: Int {
        celsius * 9/5 + 32
    }
}
