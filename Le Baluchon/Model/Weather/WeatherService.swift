//
//  WeatherService.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 23/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

enum City: String {
    case newyork
    case paris
}

class WeatherService {
    
    // MARK: Singleton
    init(weatherSession: URLSession = URLSession(configuration: .default)){
        self.weatherSession = weatherSession
    }
    private var weatherSession : URLSession
    // MARK: Method
    // Get weather information from Yahoo weather API
    func getWeather(codeLocation: String, callback: @escaping (Bool, DataWeather?) -> Void) {
        guard let url = URL(string: getURL(codeLocation: codeLocation)) else { return }
        var task: URLSessionDataTask?
        task?.cancel() // Cancel the task before to start new one
        task = weatherSession.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async{
                // Check data and no error
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }
                // Check Status response code
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                // Decode the JSON data
                guard let responseJSON = try? JSONDecoder().decode(DataWeather.self, from: data) else {
                    callback(false, nil)
                    return
                }
                // If all checks are okay, we set call back to true with the data
                callback(true, responseJSON)
            }
        }
        // Resume the task
        task?.resume()
    }
    
    
    private func getURL(codeLocation: String) -> String {
        let request = Constante.YahooWeatherAPI.request + codeLocation + Constante.YahooWeatherAPI.temp
        guard let requestEncoded = request.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        let urlRequest = Constante.YahooWeatherAPI.baseURL + requestEncoded + Constante.YahooWeatherAPI.format
        return urlRequest
    }

}
