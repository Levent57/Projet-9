//
//  Constante.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 27/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

class Constante {
    
    struct YahooWeatherAPI {
    
        static let baseURL = "https://query.yahooapis.com/v1/public/yql?q="
        static let format = "&format=json"
        static let temp = " and u='c'"
        static let request = "select item.condition from weather.forecast where woeid ="
    
//    https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202487889&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
//    select item.condition from weather.forecast where woeid = 2487889
    }

}
