//
//  BaseUseCase.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import Foundation

protocol BaseUseCase {
    associatedtype I: Sendable
    associatedtype O: Sendable
    
    func execute(input: I) -> O
}
