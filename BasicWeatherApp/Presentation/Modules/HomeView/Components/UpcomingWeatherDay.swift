//
//  UpcomingWeatherDay.swift
//  BasicWeatherApp
//
//  Created by FELIPE GADEA LLOPIS on 1/12/24.
//
import SwiftUI

struct UpcomingWeatherDay: View {
    @Environment(\.colorScheme) var colorScheme
    let day: Day
    let dateFormatter = DateFormatter()
    @State private var expanded = false
    
    init(day: Day) {
        self.day = day
        dateFormatter.dateFormat = "EEEE"
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text(dateFormatter.string(from: day.date))
            Spacer()
            VStack {
                HStack {
                    Image(systemName: "sun.max")
                    Text("\(day.temperature.celsius)")
                }
                if expanded {
                    HStack {
                        Image(systemName: "thermometer.sun")
                        Text("\(day.temperature.celsius)")
                    }
                    HStack {
                        Image(systemName: "thermometer.snowflake")
                        Text("\(day.temperature.celsius)")
                    }
                    HStack {
                        Image(systemName: "cloud.rain")
                        Text("\(day.temperature.celsius)")
                    }
                }
            }
        }
        .padding()
        .contentShape(Rectangle())
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(colorScheme == .dark ? .white : .black, lineWidth: 1)
                .padding(1)
        )
        .onTapGesture {
            withAnimation {
                expanded = !expanded
            }
        }
    }
}
