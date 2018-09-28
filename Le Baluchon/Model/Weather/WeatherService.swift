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
    case error
}

class WeatherService {
    
    init(weatherSession: URLSession = URLSession(configuration: .default)){

        self.weatherSession = weatherSession
    }
    
    private var weatherSession : URLSession

    func getWeather(codeLocation: String, callback: @escaping (Bool, DataWeather?) -> Void) {
    
//        guard let query =  URL (string: "\(QUERY_PREFIX)\( codeLocation.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)\(QUERY_SUFFIX)") else {
//            callback(false, nil)
//            return
//        }
        guard let url = URL(string: getURL(codeLocation: codeLocation)) else { return }
//        guard let url = getURL(codeLocation: codeLocation) else {
//            callback(false, nil)
//            return
//        }
    
        var task: URLSessionDataTask?
        
        task?.cancel()
        
        task = weatherSession.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async{
                
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                
                
                guard let responseJSON = try? JSONDecoder().decode(DataWeather.self, from: data) else {
                    callback(false, nil)
                    return
                }
                
                callback(true, responseJSON)
            }
            
        }
        task?.resume()
    }
    
    
    private func getURL(codeLocation: String) -> String {
        let request = Constante.YahooWeatherAPI.request + codeLocation + Constante.YahooWeatherAPI.temp + Constante.YahooWeatherAPI.format
        print(request)
        guard let requestEncoded = request.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        print(requestEncoded)
        let urlRequest = Constante.YahooWeatherAPI.baseURL + requestEncoded //+ Constante.YahooWeatherAPI.format
        print(urlRequest)
//        let url = URL(string: urlRequest)
        return urlRequest
    }

}
