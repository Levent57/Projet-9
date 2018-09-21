//
//  ServiceCurrencyTest.swift
//  LeBaluchonTests
//
//  Created by Levent Bostanci on 21/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation
import XCTest
@testable import Le_Baluchon

class CurrencyServiceTest: XCTestCase {

    func testGetCurrencyShouldPostFailedCallbackIfError(){
        
    let currencyService = CurrencyService(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
    
    let excpectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrecy { (success, currency) in
            
            XCTAssertFalse(success)
            XCTAssertNil(currency)
            excpectation.fulfill()
        }
        
        wait(for: [excpectation], timeout: 0.01)
        
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfNoData() {
        
        let currencyService = CurrencyService(session: URLSessionFake(data: nil, response: nil, error: nil))
        
        let excpectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrecy { (success, currency) in
            
            XCTAssertFalse(success)
            XCTAssertNil(currency)
            excpectation.fulfill()
        }
        
        wait(for: [excpectation], timeout: 0.01)
        
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse() {
        
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseKO, error: nil))
        
        let excpectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrecy { (success, currency) in
            
            XCTAssertFalse(success)
            XCTAssertNil(currency)
            excpectation.fulfill()
        }
        
        wait(for: [excpectation], timeout: 0.01)
        
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectData() {

        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyIncorrectData, response: FakeResponseData.responseOK, error: nil))
        
        let excpectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrecy { (success, currency) in
            
            XCTAssertFalse(success)
            XCTAssertNil(currency)
            excpectation.fulfill()
        }
        
        wait(for: [excpectation], timeout: 0.01)
        
    }
    
    func testGetCurrencyShouldPostSuccessCallbackIfCorrectDataAndNoError(){

        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        currencyService.getCurrecy { (success, currency) in
            
            let baseCurrency = "EUR"
            let usdRates: Double = 1.178266
            
            XCTAssertTrue(success)
            XCTAssertNotNil(currency)
            
            XCTAssertEqual(baseCurrency, currency?.baseCurrency)
            XCTAssertEqual(usdRates, currency?.rates?.usd)
            expectation.fulfill()
            
        }
        
        wait(for: [expectation], timeout: 0.01)
        
    }
    
}
