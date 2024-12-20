//
//  MainView.swift
//  WeatherTracker
//
//  Created by Islombek Abdulakhatov on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(city: $city, onSearch: {
                    viewModel.fetchWeather(for: city)
                })
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else if let weather = viewModel.weather {
                    WeatherDetailView(weather: weather)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    StartingView()
                }
                
                Spacer()
            }
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}
