//
//  WeatherDetailsView.swift
//  WeatherTracker
//
//  Created by Islombek Abdulakhatov on 19/12/24.
//

import SwiftUI

struct WeatherDetailView: View {
    let weather: Weather
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(weather.location.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image(systemName: "location.fill")
                    .foregroundColor(.blue)
            }
            
            Image(systemName: "sun.max.fill") 
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
            
            Text("\(Int(weather.current.temp_f))°")
                .font(.system(size: 80))
                .fontWeight(.bold)
            
            HStack {
                WeatherInfoView(title: "Humidity", value: "\(weather.current.humidity)%")
                WeatherInfoView(title: "UV", value: "\(weather.current.uv)")
                WeatherInfoView(title: "Feels Like", value: "\(Int(weather.current.temp_f))°")
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
struct WeatherInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
        }
    }
}
