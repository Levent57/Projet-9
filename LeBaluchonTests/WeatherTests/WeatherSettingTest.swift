//
//  WeatherSettingTest.swift
//  LeBaluchonTests
//
//  Created by Levent Bostanci on 09/11/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation
import XCTest
@testable import Le_Baluchon

class WeatherSettingTest: XCTestCase {
    

    func testGivenNoCodeCondition_WhenCallMethod_ThenIconNameIsEmptyImage() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: nil)
        
        XCTAssertEqual(iconeName, "EmptyImage")
    }
    
    func testGivenBadCodeCondition_WhenCallMethod_ThenIconNameIsEmptyImage() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "9672")
        
        XCTAssertEqual(iconeName, "EmptyImage")
    }
    
    func testGivenNoneIntConvertibleCodeCondition_WhenCallMethod_ThenIconNameIsEmptyImage() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "abcd")
        
        XCTAssertEqual(iconeName, "EmptyImage")
    }
    
    func testGivenCodeConditionIs0_WhenCallMethod_ThenIconNameIsTornado() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "0")
        
        XCTAssertEqual(iconeName, "Tornado")
    }
    
    func testGivenCodeConditionIs1_WhenCallMethod_ThenIconNameIsHurricane() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "1")
        
        XCTAssertEqual(iconeName, "Hurricane")
    }
    
    func testGivenCodeConditionIs3_WhenCallMethod_ThenIconNameIsCloudRainThunder() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "3")
        
        XCTAssertEqual(iconeName, "CloudRainThunder")
    }
    
    func testGivenCodeConditionIs7_WhenCallMethod_ThenIconNameIsModSleet() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "7")
        
        XCTAssertEqual(iconeName, "ModSleet")
    }
    
    func testGivenCodeConditionIs9_WhenCallMethod_ThenIconNameIsDrizzle() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "9")
        
        XCTAssertEqual(iconeName, "Drizzle")
    }
    
    func testGivenCodeConditionIs40_WhenCallMethod_ThenIconNameIsHeavyRain() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "40")
        
        XCTAssertEqual(iconeName, "HeavyRain")
    }
    
    func testGivenCodeConditionIs42_WhenCallMethod_ThenIconNameIsOccLightSnow() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "42")
        
        XCTAssertEqual(iconeName, "OccLightSnow")
    }
    
    func testGivenCodeConditionIs17_WhenCallMethod_ThenIconNameIsSleet() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "17")
        
        XCTAssertEqual(iconeName, "Sleet")
    }
    
    func testGivenCodeConditionIs20_WhenCallMethod_ThenIconNameIsMist() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "20")
        
        XCTAssertEqual(iconeName, "Mist")
    }
    
    func testGivenCodeConditionIs23_WhenCallMethod_ThenIconNameIswind() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "23")
        
        XCTAssertEqual(iconeName, "wind")
    }
    
    func testGivenCodeConditionIs25_WhenCallMethod_ThenIconNameIsCold() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "25")
        
        XCTAssertEqual(iconeName, "Cold")
    }
    
    func testGivenCodeConditionIs26_WhenCallMethod_ThenIconNameIsCloudy() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "26")
        
        XCTAssertEqual(iconeName, "Cloudy")
    }
    
    func testGivenCodeConditionIs27_WhenCallMethod_ThenIconNameIsCloudyNight() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "27")
        
        XCTAssertEqual(iconeName, "CloudyNight")
    }
    
    func testGivenCodeConditionIs28_WhenCallMethod_ThenIconNameIsCloudyDay() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "28")
        
        XCTAssertEqual(iconeName, "CloudyDay")
    }
    
    func testGivenCodeConditionIs33_WhenCallMethod_ThenIconNameIsPartlyCloudyNight() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "33")
        
        XCTAssertEqual(iconeName, "PartlyCloudyNight")
    }
    
    func testGivenCodeConditionIs34_WhenCallMethod_ThenIconNameIsPartlyPartlyCloudyDay() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "34")
        
        XCTAssertEqual(iconeName, "PartlyCloudyDay")
    }
    
    func testGivenCodeConditionIs31_WhenCallMethod_ThenIconNameIsClear() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "31")
        
        XCTAssertEqual(iconeName, "Clear")
    }
    
    func testGivenCodeConditionIs32_WhenCallMethod_ThenIconNameIsSunny() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "32")
        
        XCTAssertEqual(iconeName, "Sunny")
    }
    
    func testGivenCodeConditionIs35_WhenCallMethod_ThenIconNameIsRainHail() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "35")
        
        XCTAssertEqual(iconeName, "RainHail")
    }
    
    func testGivenCodeConditionIs36_WhenCallMethod_ThenIconNameIsHot() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "36")
        
        XCTAssertEqual(iconeName, "Hot")
    }
    
    func testGivenCodeConditionIs3200_WhenCallMethod_ThenIconNameIsEmptyImage() {
        let iconeName = WeatherSetting.getWeatherIconSettings(weatherCodes: "3200")
        
        XCTAssertEqual(iconeName, "EmptyImage")
    }


}
