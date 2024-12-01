//
//  DependencyInjection.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import Foundation
import SwiftUI

@MainActor
@Observable
class DependencyInjection {
    let id = UUID()
    
    func getHomeView() -> HomeView {
        HomeView(viewModel: getHomeViewModel())
    }

    private func getHomeViewModel() -> HomeViewModel {
        HomeViewModel(weatherUseCase: getWeatherUseCase())
    }
    
    private func getWeatherUseCase() -> WeatherUseCase {
        LiveWeatherUseCase(repository: getWeatherRepository())
    }
    
    private func getWeatherRepository() -> WeatherRepository {
        LiveWeatherRepository(remoteService: getWeatherRemoteService())
    }
    
    private func getWeatherRemoteService() -> WeatherRemoteService {
        LiveWeatherRemoteService()
    }
}
