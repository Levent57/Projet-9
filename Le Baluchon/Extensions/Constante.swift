//
//  Constante.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 27/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

class Constante {
    
    //Constants API for Yahoo Weather
    struct YahooWeatherAPI {
    
        static let baseURL = "https://query.yahooapis.com/v1/public/yql?q="
        static let format = "&format=json"
        static let temp = " and u='c'"
        static let request = "select item.condition from weather.forecast where woeid ="
    }
    
    //Constants API for Google Translate
    struct TranslationAPI {
        
        static let baseURL = "https://translation.googleapis.com/language/translate/v2?"
        static let key = "key=AIzaSyCuum7i7Byx4LEA6AK6AiiwnAeqqwXlO_M"
        static let format = "&format=text"
        static let source = "&source="
        static let target = "&target="
        static let textToTranslateParameter = "&q="
    }

    
}
