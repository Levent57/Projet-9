//
//  TranslationServiceTest.swift
//  LeBaluchonTests
//
//  Created by Levent Bostanci on 07/10/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation
import XCTest
@testable import Le_Baluchon

class TranslationServiceTest: XCTestCase {
    
    func testGetTranslationShouldPostFailedCallbackIfError(){
        
        let translationService = TranslationService(translationSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(source: .fr, target: .en, textToTranslate: "Salut") { (success, TranslatedText) in
            
            XCTAssertFalse(success)
            XCTAssertNil(TranslatedText)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetTranslationShouldPostFailedCallbackIfNoData() {
        
        let translationService = TranslationService(translationSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(source: .fr, target: .en, textToTranslate: "Salut") { (success, TranslatedText) in
            
            XCTAssertFalse(success)
            XCTAssertNil(TranslatedText)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectResponse() {
        
        let translationService = TranslationService(translationSession: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseKO, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(source: .fr, target: .en, textToTranslate: "Salut") { (success, TranslatedText) in
            
            XCTAssertFalse(success)
            XCTAssertNil(TranslatedText)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectData() {
        
        let translationService = TranslationService(translationSession: URLSessionFake(data: FakeResponseData.IncorrectData, response: FakeResponseData.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(source: .fr, target: .en, textToTranslate: "Salut") { (success, TranslatedText) in
            
            XCTAssertFalse(success)
            XCTAssertNil(TranslatedText)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
        
    }

    func testGetTranslationShouldPostSuccessCallbackIfCorrectDataAndNoError(){

        let translationService = TranslationService(translationSession: URLSessionFake(data: FakeResponseData.translationCorrectData, response: FakeResponseData.responseOK, error: nil))

        let expectation = XCTestExpectation(description: "Wait for queue change")
        translationService.getTranslation(source: .fr, target: .en, textToTranslate: "Salut") { (success, TranslatedText) in

            let translatedTextTest = "Hello"

            XCTAssertTrue(success)
            XCTAssertNotNil(TranslatedText?.translatedText)

            XCTAssertEqual(translatedTextTest, TranslatedText?.translatedText)
            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 0.01)

    }
    
//    func textGetWrongTranslationSouldPostSuccessCallbackIfCorrectDataAndNoError() {
//
//        let translationService = TranslationService(translationSession: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseOK, error: nil))
//
//        let expectation = XCTestExpectation(description: "Wait for queue change")
//        translationService.getTranslation(source: .fr, target: .error, textToTranslate: "Salut") { (success, TranslatedText) in
//
//            XCTAssertFalse(success)
//            XCTAssertNil(TranslatedText?.translatedText)
//            expectation.fulfill()
//
//        }
//
//        wait(for: [expectation], timeout: 0.01)
//    }
    
}

