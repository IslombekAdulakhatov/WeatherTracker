//
//  Weather.swift
//  WeatherTracker
//
//  Created by Islombek Abdulakhatov on 19/12/24.
//

import Foundation

struct Weather: Codable {
    let location: Location
    let current: CurrentWeather
}

struct Location: Codable {
    let name: String
}

struct CurrentWeather: Codable {
    let temp_f: Double
    let condition: WeatherCondition
    let humidity: Int
    let uv: Int
}

struct WeatherCondition: Codable {
    let text: String
    let icon: String
}
