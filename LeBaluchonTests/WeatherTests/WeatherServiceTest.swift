//
//  WeatherServiceTest.swift
//  LeBaluchonTests
//
//  Created by Levent Bostanci on 27/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation
import XCTest
@testable import Le_Baluchon

class WeatherServiceTest: XCTestCase {
    
    func testGetWeatherShouldPostFailedCallbackIfError() {
    
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
    
        let expectation = XCTestExpectation(description: "Wait for queue change.")
    
        weatherService.getWeather(codeLocation: CodeLocation.newyork) { (success, DataWeather) in
        
            XCTAssertFalse(success)
            XCTAssertNil(DataWeather)
            expectation.fulfill()
        
        }
    
        wait(for: [expectation], timeout: 0.01)
    
    }

    func testGetWeatherShouldPostFailedCallbackIfNoData(){
    
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        weatherService.getWeather(codeLocation: CodeLocation.newyork) { (success, DataWeather) in
            
            XCTAssertFalse(success)
            XCTAssertNil(DataWeather)
            expectation.fulfill()
        
        }
        
        wait(for: [expectation], timeout: 0.01)

    }
    
    func testGetWeatherSouldPostFailedCallbackIfIncorrectResponse() {
        
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData , response: FakeResponseData.responseKO, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        weatherService.getWeather(codeLocation: CodeLocation.newyork) { (success, DataWeather) in
            
            XCTAssertFalse(success)
            XCTAssertNil(DataWeather)
            expectation.fulfill()
            
        }
        
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
        
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.IncorrectData, response: FakeResponseData.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        weatherService.getWeather(codeLocation: CodeLocation.newyork) { (success, DataWeather) in
            
            XCTAssertFalse(success)
            XCTAssertNil(DataWeather)
            expectation.fulfill()
            
        }
        
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
