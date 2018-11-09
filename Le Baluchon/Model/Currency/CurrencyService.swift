//
//  Currency.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 09/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

class CurrencyService {
    
    // MARK: Singleton
    // This initializer is used only for testing
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    private var session: URLSession
    // MARK: Method
    // Get currency from remote API
    func getCurrecy(callback: @escaping (Bool, Currency?) -> Void){
        let currencyURL = URL (string: "http://data.fixer.io/api/latest?access_key=c4408dceeb3f717d443bd62d537d6246&base=EUR&symbols=USD")!
        var task: URLSessionDataTask?
        task?.cancel() // Cancel the task before to start new one
        task = session.dataTask(with: currencyURL) { (data, response, error) in
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
                guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data) else {
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

}
