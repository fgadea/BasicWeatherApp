//
//  HomeView.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 30/11/24.
//
import SwiftUI

struct HomeView: View {
    @Environment(DependencyInjection.self) private var dependencyInjection
    @State var viewModel: HomeViewModel
    @FocusState private var searchBarFocusState: Bool

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Your current location:")
                        .font(.headline)
                    Text(viewModel.weatherLocation)
                        .font(.subheadline)
                    searchBar()
                    if viewModel.isSearching {
                        
                    } else  {
                        VStack {
                            currentWeather()
                            currentWeatherSummary()
                        }
                        Text("Upcoming days")
                            .font(.title3.bold())
                        ForEach(viewModel.upcomingDays) { day in
                            UpcomingWeatherDay(day: day)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker(
                        "MeasurementSystem",
                        selection: $viewModel.isMetricSystem
                    ) {
                        Image(systemName: "degreesign.fahrenheit").tag(false)
                        Image(systemName: "degreesign.celsius").tag(true)
                    }
                    .pickerStyle(.segmented)
                    .colorMultiply(viewModel.isMetricSystem ? .green : .teal)
                }
            }
            .navigationTitle("Weather Site")
            .onChange(of: searchBarFocusState) {
                withAnimation(.easeOut(duration: 0.3)) {
                    viewModel.isSearching = searchBarFocusState
                }
            }
        }
    }

    private func searchBar() -> some View {
        HStack {
            TextField("Search...", text: $viewModel.searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .focused($searchBarFocusState)
                .onSubmit {
                    print(viewModel.searchText)
                }
            if viewModel.isSearching {
                Button(action: {
                    searchBarFocusState = false
                }) {
                    Text("Cancel")
                }
            }
        }
        .padding(.vertical, 8)
    }
    
    private func currentWeather() -> some View {
        VStack {
            Text("+32")
                .font(.system(size: 50, weight: .bold))
            Text("Helsinki")
                .font(.largeTitle.bold())
            Text("Sunny and hot")
        }
    }
    
    private func currentWeatherSummary() -> some View {
        HStack {
            HStack {
                Image(systemName: "thermometer.sun")
                Text("Max +33.1")
            }
            Spacer()
            HStack {
                Image(systemName: "thermometer.snowflake")
                Text("Min +15.13")
            }
            Spacer()
            HStack {
                Image(systemName: "cloud.rain")
                Text("Rain 2mm")
            }
        }
    }
}

#Preview {
    let dependencyInjection = DependencyInjection()
    
    return dependencyInjection.getHomeView()
}
