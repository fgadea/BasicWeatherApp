//
//  BasicWeatherAppApp.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 30/11/24.
//

import SwiftUI
import SwiftData

@main
struct BasicWeatherAppApp: App {
    @State private var dependencyInjection = DependencyInjection()
    
    var body: some Scene {
        WindowGroup {
            dependencyInjection.getHomeView()
                .environment(dependencyInjection)
        }
    }
}
