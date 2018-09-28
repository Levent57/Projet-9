//
//  WeatherSetting.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 26/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

class WeatherSetting {

    func convert(temp: String) -> String? {
        
        guard let temp = Double(temp) else { return nil }

        
        return String(format: "%.0f", temp) + "°C"
    }
    
    
//    var isCelsius: Bool?
//
//    func converter(temp: Int) -> Int? {
//        if isCelsius! {
//            return (((temp-32) * 5)/9)
//        }
//        return temp
//    }
    
    
    
    static func getWeatherIconSettings(weatherCodes: String?) -> String {
        
        guard let weatherCodes = weatherCodes, let weatherCode = Int(weatherCodes) else { return "EmptyImage" }
        switch weatherCode {
        case 0:
            return "Tornado"
        case 1...2:
            return "Hurricane"
        case 3...4, 37...39, 45, 47 :
            return "CloudRainThunder"
        case 5...7, 10:
            return "ModSleet"
        case 8...9:
            return "Drizzle"
        case 11...12, 40:
            return "HeavyRain"
        case 13...16, 41...43, 46:
            return "OccLightSnow"
        case 17...18:
            return "Sleet"
        case 19...22:
            return "Mist"
        case 23...24:
            return "wind"
        case 25:
            return "Cold"
        case 26:
            return "Cloudy"
        case 27:
            return "CloudyNight"
        case 28:
            return "CloudyDay"
        case 29, 33:
            return "PartlyCloudyNight"
        case 30, 34, 44:
            return "PartlyCloudyDay"
        case 31:
            return "Clear"
        case 32:
            return "Sunny"
        case 35:
            return "RainHail"
        case 36:
            return "Hot"
        case 3200:
            return "EmptyImage"
        default:
            return "EmptyImage"
        }
    }
}
//let weatherCodes = [0:"Tornade",
//                        1: "Tempête tropicale",
//                        2: "Ouragan",
//                        3: "Orages violents",
//                        4: "Orages",
//                        5: "Pluie et neige mêlées",
//                        6: "Pluie mixte et giboulée",
//                        7: "Neige mêlée et grésil",
//                        8: "Bruine verglaçante",
//                        9: "Bruine",
//                        10: "Pluie verglaçante",
//                        11: "Averses",
//                        12: "Averses",
//                        13: "Averses de neige",
//                        14: "Faibles averses de neige",
//                        15: "Neige et vent",
//                        16: "Neige",
//                        17: "Grêle",
//                        18: "Grésil",
//                        19: "Poussiéreux",
//                        20: "Brumeux",
//                        21: "Brume",
//                        22: "Enfumé",
//                        23: "Venteux",
//                        24: "Venteux",
//                        25: "Froid",
//                        26: "Nuageux",
//                        27: "Généralement nuageux",
//                        28: "Peu nuageux",
//                        29: "Partiellement nuageux",
//                        30: "Partiellement nuageux",
//                        31: "Dégagé",
//                        32: "Ensoleillé",
//                        33: "Clément",
//                        34: "Clément",
//                        35: "Pluie et grêle",
//                        36: "Chaud",
//                        37: "Orages isolés",
//                        38: "Orages épars",
//                        39: "Orages épars",
//                        40: "Averses éparses",
//                        41: "Neige lourde",
//                        42: "Averses de neige dispersées",
//                        43: "Neige lourde",
//                        44: "Partiellement nuageux",
//                        45: "Orages",
//                        46: "Averses de neige",
//                        47: "Orages isolés"]
//
//let enToFrDay = ["Mon":"Lundi",
//                 "Tue":"Mardi",
//                 "Wed":"Mercredi",
//                 "Thu":"Jeudi",
//                 "Fri":"Vendredi",
//                 "Sat":"Samedi",
//                 "Sun":"Dimanche"]


