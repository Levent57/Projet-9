//
//  Currency.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 09/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

class CurrencyService {
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    private var session: URLSession
    
    
    func getCurrecy(callback: @escaping (Bool, Currency?) -> Void){
        
//        typealias FixerURL = Constants.Currency
//        let urlString = FixerURL.baseURL + FixerURL.accesKey + FixerURL.key + FixerURL.symbole + "usd"
//        let url = URL(string: urlString)!
//
        let currencyURL = URL (string: "http://data.fixer.io/api/latest?access_key=c4408dceeb3f717d443bd62d537d6246&base=EUR&symbols=USD")!
        var task: URLSessionDataTask?

        task?.cancel()
        
        task = session.dataTask(with: currencyURL) { (data, response, error) in
            
            DispatchQueue.main.async{
                
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }

            
                guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data) else {
                    callback(false, nil)
                    return
                }
                
                callback(true, responseJSON)
            }
            
        }
        task?.resume()
    }
    
//    private static func creatCurrencyRequest() -> URLRequest{
//        var request = URLRequest(url: URL(string: Constants.Currency.baseURL + Constants.Currency.accesKey)!)
//        request.httpMethod = Constants.Currency.method
//
//        let body = Constants.Currency.symbole + Constants.Currency.suffix
//        request.httpBody = body.data(using: .utf8)
//
//        return request
//    }

}
