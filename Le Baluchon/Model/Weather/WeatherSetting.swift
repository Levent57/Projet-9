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
