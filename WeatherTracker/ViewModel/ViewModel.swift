import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private let apiKey = "ec26c307f34b42b786624424242012"
    private let baseURL = "https://api.weatherapi.com/v1/current.json"
    
    func fetchWeather(for city: String) {
        guard let url = URL(string: "\(baseURL)?key=\(apiKey)&q=\(city)") else {
            errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = "Error: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self?.errorMessage = "No data found"
                    return
                }
                
                do {
                    let weather = try JSONDecoder().decode(Weather.self, from: data)
                    self?.weather = weather
                } catch {
                    self?.errorMessage = "Failed to decode JSON: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
